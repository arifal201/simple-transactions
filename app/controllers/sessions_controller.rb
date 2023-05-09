class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      token = JWT.encode({ user_id: user.id }, Rails.application.secret_key_base)

      render json: { token: token }
    else
      render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
    end
  end
end
