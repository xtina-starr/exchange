require 'rails_helper'

RSpec.describe "visit order details", type: :system do

  it "renders order overview page" do
    allow_any_instance_of(ApplicationController).to receive(:require_artsy_authentication)
    visit "/admin"
  end

end