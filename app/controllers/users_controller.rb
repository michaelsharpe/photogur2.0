class UsersController < ApplicationController
  def new
    @disable_right_side = true
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_url, :notice => "Signd up!"
    else
      render "new"
    end
  end  

  private
  def user_params
    params.require(:user).permit(:user, :email, :password)
  end

end
