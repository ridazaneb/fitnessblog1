class UsersController < ApplicationController
  def new
     @user = User.new
  end

  def create
     @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Sign up successful!"
    else
      render :ne
  end
end

 private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
