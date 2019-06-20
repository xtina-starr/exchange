# typed: false
require 'rails_helper'

RSpec.describe Fulfillment, type: :model do
  it_behaves_like 'a papertrail versioned model', :fulfillment
end
