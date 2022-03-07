class Api::V1::SessionsController < ApplicationController

  def show
    user = User.find_by(email: params[:email])
    if user.present?
      render json: UserSerializer.user(user)
    else
      render json: JSON.generate({error: 'invalid login credentials'}), status: 400
    end
  end

private

  def user_params
    params.permit(:email, :password, :password_confirmation, :auth_token)
  end
end
