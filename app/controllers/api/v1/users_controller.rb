class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      user.update(api_key: JsonWebToken.encode(user_id: user.id))
      user.save
      session[:user_id] = user.id
      render json: UserSerializer.new(user)
    else
      error = user.errors.full_messages
      render json: {code: 400, message: error}
    end

  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
