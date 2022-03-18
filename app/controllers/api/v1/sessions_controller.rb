class Api::V1::SessionsController < ApplicationController

  def show
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.user(user)
      TwilioService.create_message(user.phone_number)
      #this sends a text when logged in
    else
      render json: JSON.generate({error: 'invalid login credentials'}), status: 400
    end
  end

private

  def user_params
    params.permit(:email, :password, :phone_number, :password_confirmation, :auth_token)
  end
end
