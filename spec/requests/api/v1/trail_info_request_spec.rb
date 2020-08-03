
require 'rails_helper'

describe "trails request" do
  scenario "request returns trail info, distance, weather", :vcr do
    get "/api/v1/trails?location=denver,co"

    results = JSON.parse(response.body, symbolize_names: true)
    expect(results[:data][:type]).to eq("trail")
    expect(results[:data][:attributes].keys).to eq([:location, :forecast, :trails])
    expect(results[:data][:attributes][:forecast].class).to eq(Hash)
    expect(results[:data][:attributes][:trails].class).to eq(Array)
  end
end
