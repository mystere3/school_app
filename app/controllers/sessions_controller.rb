class SessionsController < ApplicationController

  before_action :authenticate_user!, only: [:destroy]

  def new
    
  end

  def create
    # find the user by email
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      #happy path - successful login
      session[:user_id] = user.id
      redirect_to :root, notice: "Welcome back #{user.email}!"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root, notice: "Successfully logged out"
  end
  
end