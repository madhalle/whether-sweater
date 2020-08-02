require 'rails_helper'

feature "Weather API" do
  it "sends weather data for a location" do
    weather = LocationService.new("denver, CO").get_location

    expect(weather[:results][:locations][:latLng][:lat]).to eq(39.738453)
    expect(weather[:results][:locations][:latLng][:lng]).to eq(-104.984853)

  end
end

#
# GET /api/v1/forecast?location=denver,co
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
