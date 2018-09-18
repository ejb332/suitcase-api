class ApplicationController < ActionController::Base
  # use null_session for APIs
  protect_from_forgery with: :null_session
end
