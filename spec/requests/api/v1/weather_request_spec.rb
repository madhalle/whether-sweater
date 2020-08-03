require 'rails_helper'

describe "Weather api request" do
  it "can retrieve info from weather site" , :vcr do

    get "/api/v1/forecast?location=denver,co"
    expect(response).to be_successful

    weather_report = JSON.parse(response.body, symbolize_names: true)
    expect(weather_report.class).to eq(Hash)
    expect(weather_report[:data][:id]).to be_nil
    expect(weather_report[:data][:type]).to eq("forecast")
    expect(weather_report[:data][:attributes].keys).to eq([:current, :hourly, :daily])
  end
end
