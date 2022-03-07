class Api::V1::UsersController < ApplicationController

  def create
    if params[:password] == params[:password_confirmation] && params[:email].present?
      new_user = User.create(user_params)
      render json: UserSerializer.user(new_user), status: 201
    else
      render json: JSON.generate({error: 'invalid login credentials'}), status: 400
    end
  end

private

  def user_params
    params.permit(:email, :password, :password_confirmation, :auth_token)
  end
end
