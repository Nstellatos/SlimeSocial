class SessionsController < ApplicationController
  def new
  end

  def create 
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      #module helper to log a user in
      log_in user 
      #redirect
    else
      #if email/password not match
      flash.now[:danger] = "email or password is invalid"
      #render log in again
      render 'new'
    end
  end




end
