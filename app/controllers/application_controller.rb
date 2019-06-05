class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

 before_action :logged_in_user
 before_action :admin_user

 private

  def logged_in_user
      unless logged_in?
        flash[:danger] = "Необходима авторизация"
        redirect_to login_url
      end
  end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
