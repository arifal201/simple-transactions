class UsersController < ApplicationController
  # skip_before_action :authenticate_user, only: :create

  def create
    user = User.new(user_params)

    if user.save
      token = JWT.encode({ user_id: user.id }, Rails.application.secret_key_base)

      render json: { token: token }
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :password_digest)
  end
end
