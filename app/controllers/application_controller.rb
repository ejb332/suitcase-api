class ApplicationController < ActionController::Base
  # use null_session for APIs
  protect_from_forgery with: :null_session

  def current_user
    auth_headers = request.headers['Authorization']
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      p "=" * 50
      p token
      p "=" * 50
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.secrets.fetch(:secret_key_base),
          true,
          { algorithm: 'HS256' }
        )
      p "=" * 50
      p decoded_token
      p "=" * 50
        User.find_by(id: decoded_token[0]["user_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_user # allows use of current_user in all views

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end

  def authenticate_admin
    unless current_user && current_user.admin
      render json: {}, status: :unauthorized
    end
  end
end
