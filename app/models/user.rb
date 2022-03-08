class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: {message: "can't be blank"},
            uniqueness: true

  def self.arguments_dont_match(arg_1, arg_2)
    if arg_1 != arg_2
      render json: JSON.generate({error: 'password dont match'}), status: 400
    end
  end

  def self.email_not_unique(arg_1)
    if User.find_by(email: arg_1)
      render json: JSON.generate({error: 'email has already been taken'}), status: 400
    end
  end
end
