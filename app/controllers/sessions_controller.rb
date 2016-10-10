class SessionsController < ApplicationController

  attr_accessor :user

  def new
    if session[:user_id] then
      redirect_to User.find(session[:user_id])
    end
  end
  
  def create
    user = User.find_by(username: params[:session][:username].downcase)
    
    if user && user.authenticate(params[:session][:password]) then
      flash[:success] = 'Login successful'
      log_in user
      redirect_to users_url
    else
      flash[:danger] = 'Invalid user/password combination'
      render 'new'
    end
    
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
