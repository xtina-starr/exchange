class OrderFollowUpJob < ApplicationJob
  queue_as :default

  def perform(order_id, state)
    order = Order.find(order_id)
    unless order.state == state && Time.zone.now >= order.state_expires_at
      return
    end

    case order.state
    when Order::PENDING
      OrderService.abandon!(order)
    when Order::SUBMITTED
      cancel_submitted_order(order)
    when Order::APPROVED
      # Order was approved but has not yet fulfilled,
      # post an event so we can contact partner
      OrderEvent.post(order, 'unfulfilled', nil)
    end
  end

  def cancel_submitted_order(order)
    if buyer_lapsed_offer?(order)
      OrderService.buyer_lapse!(order)
    else
      OrderService.seller_lapse!(order)
    end
  end

  def buyer_lapsed_offer?(order)
    order.mode == Order::OFFER &&
      order&.last_offer&.awaiting_response_from == Order::BUYER
  end
end
