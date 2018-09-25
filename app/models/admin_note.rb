class AdminNote < ApplicationRecord
  belongs_to :order
  TYPES = {
    watching: 'watching'.freeze,
    contacted_to_arrange_pickup: 'contacted_to_arrange_pickup'.freeze,
    contacted_buyer: 'contacted_buyer'.freeze,
    contacted_seller: 'contacted_seller'.freeze,
    manual_order_change: 'manual_order_change'.freeze,
    resolved_conversation: 'resolved_conversation'.freeze,
    not_yet_contacted: 'not_yet_contacted'.freeze
  }.freeze
end
