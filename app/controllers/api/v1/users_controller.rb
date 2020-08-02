class Api::V1::UsersController < ApplicationController
  def create
    User.create!(params[:email])
  end
end
