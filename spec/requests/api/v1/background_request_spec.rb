require 'rails_helper'

describe "weather api" do
  it "will return the background image for a location", :vcr do

    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:data][:type]).to eq("background_image")
    expect(results[:data][:attributes].keys).to eq([:image_urls, :description, :photographer_info])

  end
end
