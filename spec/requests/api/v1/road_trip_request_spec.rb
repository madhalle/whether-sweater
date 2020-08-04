require 'rails_helper'

describe "when road trip request is made" do
  before :each do
    post "/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password"
    @user = User.last
  end
  it "response should return travel time & arrival forecast" , :vcr do
    post "/api/v1/road_trip?origin=Denver,Co&destination=Pueblo,Co&api_key=#{@user.api_key}"

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names:true)
    expect(results[:data][:attributes].keys).to eq([:origin, :destination, :time_to, :forecast])
    expect(results[:data][:attributes][:origin]).to eq("Denver,Co")
    expect(results[:data][:attributes][:destination]).to eq("Pueblo,Co")
    expect(results[:data][:attributes][:forecast]).to_not be_nil
    expect(results[:data][:attributes][:time_to].keys).to eq([:hours, :minutes, :total_time_in_seconds])
  end
end
