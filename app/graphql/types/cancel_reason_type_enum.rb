class Types::CancelReasonTypeEnum < Types::BaseEnum
  Order::REASONS[Order::CANCELED].each do |k, v|
    value k.upcase, "cancelation reason is: #{v}", value: v
  end
end
