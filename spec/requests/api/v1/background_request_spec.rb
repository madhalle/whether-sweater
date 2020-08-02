require 'rails_helper'

describe "weather api" do
  it "will return the background image for a location" do
    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful
  end
end
