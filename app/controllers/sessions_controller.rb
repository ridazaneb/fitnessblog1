class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])

    if @user && params[:password] == @user.password
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome, #{@user.username}"
    else
      flash.now[:alert] = "Invalid username or password"
      render :new
    end
  end
end
