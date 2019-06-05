class ActivatesController < ApplicationController

 skip_before_action :admin_user, only: [:new, :log]
 skip_before_action :logged_in_user, only: [:new, :log]

def new
end

  def log
     user = User.find_by(code: params[:activate][:code], state: false)
    if user 
      user.update_attributes(:email => params[:activate][:email], :password => params[:activate][:password], :state => true)
      if !user.valid?
        flash.now[:danger] = 'Некорректный E-Mail или пароль менее 6 символов'
        render 'new'
      else
      flash[:success] = 'Регистрация успешна!'
      redirect_to login_path
      

      end

    else
      flash.now[:danger] = 'Неверный код'
      render 'new'
    end
  end
 
end
