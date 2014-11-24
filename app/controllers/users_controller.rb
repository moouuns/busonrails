class UsersController < ApplicationController
  def new
    @user = User.new
  end


  private
  ## strong parameters
  def user_params
     params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to posts_url, :notice => "Signed up!"
    else
      render :new
    end
  end
end