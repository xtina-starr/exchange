class Types::OrderModeEnum < Types::BaseEnum
  Order::MODES.each do |m|
    value m.upcase, "#{m.humanize} Order", value: m
  end
end
