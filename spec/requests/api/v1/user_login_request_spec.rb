require 'rails_helper'

describe "when visiting path" do
  xit "should create a user and generate a unique api key" do
    post "/api/v1/users"
    params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
              }
    expect(response).to be_successful

    results = JSON.parse(response.body, symbolize_names: true)
    expect(results[:data][:type]).to eq("users")
    expect(results[:data][:attributes].keys).to eq([:email, :api_key])
    expect(results[:data][:id]).to_not be_nil

    user = User.last
    expect(user.email).to eq("users")
    expect(user.api_key).to_now be_nil
  end
end
