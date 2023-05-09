class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def authenticate_user
    token = request.headers['Authorization']&.split&.last

    begin
      decoded_token = JWT.decode(token, Rails.application.secret_key_base, true, { algorithm: 'HS256' })
      user_id = decoded_token.first['user_id']
      @current_user = User.find(user_id)
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
end
