class Api::V1::UsersController < ApplicationController
  before_action :check_all_fields

  def create
      User.arguments_dont_match(params[:password], params[:password_confirmation])
      User.email_not_unique(params[:email])
      new_user = User.create(user_params)
      render json: UserSerializer.user(new_user), status: 201
  end
end
private

  def user_params
    params.permit(:email, :password, :password_confirmation, :auth_token)
  end

  def check_all_fields
    if !params[:email].present? || !params[:password].present? || !params[:password_confirmation].present?
      render json: JSON.generate({error: 'missing fields'}), status: 400
    end
  end
