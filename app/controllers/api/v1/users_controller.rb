class Api::V1::UsersController < ApplicationController

  def create
    if params[:password] == params[:password_confirmation] && params[:email].present?
      new_user = User.create(user_params)
      render json: UserSerializer.user(new_user)
    else
      render status: 404
    end
  end

private

  def user_params
    params.permit(:email, :password, :password_confirmation, :auth_token)
  end
end
