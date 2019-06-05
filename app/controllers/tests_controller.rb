class TestsController < ApplicationController

include TestsHelper
include SessionsHelper

  skip_before_action :admin_user, only: [:show, :check]

def new
 @test = Test.new
end

def create
 @test = Test.new
 if params[:tests][:theme].empty?
  flash["danger"] = "Выберите тему"
  redirect_to root_path and return
 end
 @theme = params[:tests][:theme]
 @theme_dir = Theme.find_by(title: @theme)
 if params[:tests][:questions_file].nil? && params[:tests][:answers_file].nil?
  @test = Test.new(title: params[:tests][:title], theme: @theme, points: params[:tests][:points])
  if @test.save
   flash[:id] = @test.id
   render 'edit'
  else
   params[:theme] = @theme
   render 'new'
  end
 else
  if !params[:tests][:questions_file].nil? && !params[:tests][:answers_file].nil?
    @questions = []
    @answers = []
    @questions_file = params[:tests][:questions_file].open
     @answers_file = params[:tests][:answers_file].open

    @questions_file.each do |line|
     @questions << line.gsub("\n", '')
    end
    
    @answers_file.each do |line|
     @answers << line.gsub("\n", '')
    end
    @test = Test.new(title: params[:tests][:title], theme: params[:tests][:theme], points: params[:tests][:points], question: @questions, answer: @answers)
    if @test.save
     flash[:success] = "Тест создан!"
     redirect_to @theme_dir
    else
     params[:theme] = @theme
     render 'new'
    end
  else
   flash.now["danger"] = "Нужно прикрепить оба файла"
   params[:theme] = @theme
   render 'new'
  end
 end
end

def edit
 @test = Test.find(flash[:id])
 flash[:id] = @test.id
end

def update
  @test = Test.find(flash[:id])
  flash[:id] = @test.id
  @theme = Theme.find_by(title: @test.theme)
  if params[:commit] == "Завершить тест"
    flash["success"] = "Тест создан!"
    redirect_to @theme and return
  end

  if params[:tests][:question].empty? && params[:tests][:answer].empty?
   flash.now["danger"] = "Поля не должны быть пустыми"
   render 'edit'
  end

  if @test.question.nil? || @test.answer.nil?
   @questions = params[:tests][:question]
   @answers = params[:tests][:answer]
  else 
  @questions = @test.question << params[:tests][:question]
  @answers = @test.answer << params[:tests][:answer]
  end
  if @test.update_attributes(:question => @questions, :answer => @answers)
    flash.now["success"] = "Вопрос добавлен!"
    render 'edit'
  else
   render 'edit'
  end
end

def show
   @test = Test.find(params[:id])
   @user = current_user
   @questions = @test.question
   if @user.tests.index(@test.id)
     @points = @user.rates[@user.tests.index(@test.id)]
     @max_points = @test.question.length * @test.points 
   end
end

def check
 @test = Test.find(params[:id])
 @user = current_user
 @user.tests.each do |t|
  if t == @test.id
   flash[:danger] = "Тест уже пройден"
   redirect_to @test
   return
  end 
 end
 @point = @test.points
 @points = 0
 @questions = @test.question
 @answers = @test.answer
 @answers.each_with_index do |ans, i|
  if ans == params[:tests][:answers][i]
   @points += @point
  end
 end

 @user.tests << @test.id
 @user.rates << @points
 
 if @user.themes.empty?
  @user.themes << {@test.theme => @points}
 else
  @unique = true
  @user.themes.each do |theme|
   if theme.member? @test.theme
    @unique = false
    theme[@test.theme] += @points
   end
  end
  if @unique
   @user.themes << {@test.theme => @points}
  end
 end
 current_user.save
 redirect_to show_test_path
end
end
