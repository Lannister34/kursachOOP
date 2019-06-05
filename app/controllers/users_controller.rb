class UsersController < ApplicationController

    skip_before_action :admin_user, only: [:show]
 
    def index
     @users = User.paginate(page: params[:page])
    end

    def show
    @user = User.find(params[:id])
    @tests = @user.tests
    @themes = @user.themes
    end

    def new
    @user = User.new
    end

    def create
     @user = User.new(user_params)
     if @user.save
      flash[:success] = "Аккаунт создан!"
      redirect_to create_path
      
     else
      render 'new'
     end
    end
 
   def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удалён!"
    redirect_to users_url
   end
   private

    def user_params
      params.require(:user).permit(:admin, :name, :code, :password)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

end
