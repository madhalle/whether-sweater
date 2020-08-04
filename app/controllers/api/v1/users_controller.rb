class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save!
      user.update(api_key: JsonWebToken.encode(user_id: user.id))
      session[:user_id] = user.id
      render json: UserSerializer.new(user)
    else
      render status: 402
    end

  end

end
