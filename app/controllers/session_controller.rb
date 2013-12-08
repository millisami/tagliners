class SessionController < ApplicationController

  def create
    user = login(params[:username], params[:password])
    if user
      render :json => {access_token: 1223, token_type: 'bearer'}, status: 200
    else
      render :json => {error: "invalid_grant"}, status: 400
    end
  end
end
