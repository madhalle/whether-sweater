require 'rails_helper'

describe "when visiting path" do
  it "should create a user and generate a unique api key" do
    post "/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password"

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)
    expect(results[:data][:type]).to eq("user")
    expect(results[:data][:attributes].keys).to eq([:id, :email, :api_key])
    expect(results[:data][:attributes][:email]).to eq("whatever@example.com")
    expect(results[:data][:id]).to_not be_nil

    user = User.last
    expect(user.email).to eq("whatever@example.com")
    expect(user.password_digest).to_not be_nil
    expect(User.all.count).to eq(1)
    expect(user.api_key).to_not be_nil
  end
  it "should render a 400 error for mismatched passwords" do
    post "/api/v1/users?email=whatever@example.com&password=password&password_confirmation=pas2sword"

    results = JSON.parse(response.body, symbolize_names: true)
    expect(results[:code]).to eq(400)
    expect(results[:message]).to eq(["Password confirmation doesn't match Password"])
  end
end
