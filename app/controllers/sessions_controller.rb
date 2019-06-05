class SessionsController < ApplicationController
 
  skip_before_action :logged_in_user, only: [:new, :create]
  skip_before_action :admin_user, only: [:new, :create, :destroy]
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user

    else
      flash.now[:danger] = 'Неверный E-Mail или пароль'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
