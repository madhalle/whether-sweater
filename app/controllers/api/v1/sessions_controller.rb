class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user)
    else
      error = user.authenticate.errors.full_messages
      render json: {code: 400, message: error}
    end
  end
end
