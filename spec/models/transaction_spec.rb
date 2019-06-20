# typed: false
require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it_behaves_like 'a papertrail versioned model', :transaction
end
