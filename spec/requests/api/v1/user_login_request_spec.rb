require 'rails_helper'

describe "when sendin in current user email and password" do
  before :each do
    post "/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password"
  end
  it "return users email and api key" do
    post "/api/v1/sessions?email=whatever@example.com&password=password"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    results = JSON.parse(response.body, symbolize_names: true)
    expect(results[:data][:type]).to eq("user")
    expect(results[:data][:id]).to_not be_nil
    expect(results[:data][:attributes].keys).to eq([:id, :email, :api_key])
    expect(results[:data][:attributes][:api_key]).to_not be_nil
    expect(results[:data][:attributes][:api_key]).to eq(User.last.api_key)
  end
end
