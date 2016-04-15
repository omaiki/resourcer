class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:used_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password not recognized"
      render "new"
    end
  end
end