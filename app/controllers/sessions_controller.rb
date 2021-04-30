class SessionsController < ApplicationController
  def new
  end


  def create
    if auth_hash
      if user = User.find_by(email: auth_hash["info"]["email"])
        session[:user_id] = user.id
        redirect_to root_path
      else
        user = User.create(email: auth_hash["info"]["email"], name: auth_hash["info"]["name"], password: SecureRandom.hex)
        session[:user_id] = user.id
        redirect_to root_path
      end 
    else 
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
      #module helper to log a user in
      log_in user 
      #redirect
      redirect_to root_path
    else
      #if email/password not match
      flash.now[:danger] = "email or password is invalid"
      #render log in again
      render 'new'
    end
  end
end




  def destroy 
    log_out 
    redirect_to root_url
  end

  private

  def auth_hash
      request.env["omniauth.auth"]
  end 

end
