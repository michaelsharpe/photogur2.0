class SessionsController < ApplicationController
  def new
    @disable_right_side = true
  end

  def create
    @disable_right_side = true
    user = User.authenticate(params[:email], params[:password])
     if user
      session[:user_id] = user.id
      redirect_to pictures_path, :notice => "Logged in" 
    else
      flash.now[:notice] = "Invalid email or password."
      render "new"
    end
  end

  def destroy
    @disable_right_side = true
    session[:user_id] = nil
    redirect_to log_in_path, :notice => "Logged out"
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
