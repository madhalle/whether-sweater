require 'rails_helper'

describe "Weather api request" do
  it "can retrieve info from weather site" do

    get "/api/v1/forecast?location=denver,co"
    response = JSON.parse(response.body)
    epxect(response).to be_successful
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
