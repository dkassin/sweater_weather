class Api::V1::UsersController < ApplicationController
  before_action :check_all_fields, :check_if_arguments_match, :check_if_email_unique

  def create
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

  def check_if_arguments_match
    if params[:password] != params[:password_confirmation]
      render json: JSON.generate({error: 'password dont match'}), status: 400
    end
  end

  def check_if_email_unique
    if User.find_by(email: params[:email])
      render json: JSON.generate({error: 'email has already been taken'}), status: 400
    end
  end
