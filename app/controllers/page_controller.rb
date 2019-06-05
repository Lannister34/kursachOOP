class PageController < ApplicationController
 skip_before_action :logged_in_user, only: [:home, :about]
  skip_before_action :admin_user, only: [:home, :about]
 def home
 @theme = Theme.new
 @themes = Theme.all
 end
 

 def about
 end
 
 def create
 @theme = Theme.new(title: params[:page][:title])
 @themes = Theme.all 
  if @theme.save
   flash.now[:success] = "Тема создана!"
   home
   render 'home'
  else
   render 'home'  
  end
 end

end
