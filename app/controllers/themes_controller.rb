class ThemesController < ApplicationController

  skip_before_action :admin_user, only: [:show]

 def new
  @theme = Theme.new
  @lecture = Article.new
  
 end

 def show
  @theme = Theme.find(params[:id])
  @lectures = Article.all
  @tests = Test.all
 end
 
 def create
 @tests = Test.all
 @lectures = Article.all
 @theme = Theme.find(params[:id])

 if !params[:themes][:file].nil?
   @text = params[:themes][:file].read.force_encoding('UTF-8')
 else
  @text = params[:themes][:area]
 end

 @lecture = Article.new(:theme => @theme[:title], :title => params[:themes][:title], :text => @text)
 if @lecture.save
  flash.now[:success] = "Лекция создана!"
  render 'show'
 else
  render 'new'
 end
 end

end
