require 'rails_helper'

describe "Weather api request" do
  it "can retrieve info from weather site" , :vcr do

    # request = JSON.parse(response.body)
    get "/api/v1/forecast?location=denver,co"
    expect(response).to be_successful

    weather_report = JSON.parse(response.body, symbolize_names: true)
    expect(weather_report.class).to eq(Hash)
    expect(weather_report[:data][:id]).to be_nil
    expect(weather_report[:data][:type]).to eq("forecast")
    expect(weather_report[:data][:attributes].keys).to eq([:current, :hourly, :daily])
  end
end

#
# Content-Type: application/json
# Accept: application/json
#
# Needs to pull out the city and state from
# the GET request and send it to MapQuest’s
# Geocoding API to retrieve the lat and long
# for the city (this can be its own story).
# Use of the MapQuest’s Geocoding API is a
# hard requirement. Retrieve forecast data
# from the OpenWeather One Call API using the lat and long
