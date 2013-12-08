class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

# protected

#   def current_member
#     @user ||= User.where(auth_token: auth_token).first
#   end

#   def auth_token
#     request.headers['Authorization'].split(" ").last
#   end
end
