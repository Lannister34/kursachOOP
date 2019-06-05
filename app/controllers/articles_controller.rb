class ArticlesController < ApplicationController

 skip_before_action :admin_user, only: [:show]

 def new
 end
 
 def show
 @lecture = Article.find(params[:id])
 end 

 def edit
 @lecture = Article.find(params[:id])
 end

 def update
 @lecture = Article.find(params[:id])
 if @lecture.update_attributes(:title => params[:articles][:title], :text => params[:articles][:area])
  flash.now[:success] = "Лекция отредактирована!"
  render 'show'
 else
  render 'edit'
 end
 end

 def destroy
  @lecture = Article.find(params[:id])
  @theme = Theme.find_by(:title => @lecture.theme)
  @lecture.destroy
  flash[:success] = "Лекция удалена!"
  redirect_to @theme
 end
end
