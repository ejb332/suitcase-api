class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email]) # find user in db
    if user && user.authenticate(params[:password]) # if user & password match up
      jwt = JWT.encode(
      {
        user_id: user.id, # encode all data with this id
        exp: 24.hours.from_now.to_i # set expiration for 24 hours
      },
      Rails.application.secrets.fetch(:secret_key_base), # the secret key
      'HS256' # the encryption algorithm
      )
      render json: {jwt: jwt, email: user.email}, status: :created
    else
      render json: {}
    end
  end
end
