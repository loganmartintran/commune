class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]

    if @question.save
      flash[:notice] = "New question has been posted."
      redirect_to @question
    else
      flash.now[:alert] = "There was an error in posting that question. Please try again."
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]

    if @question.save
      flash[:notice] = "Your question has been updated"
      redirect_to @question
    else
      flash.now[:alert] = "There was an error updating your question. Please try again."
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])

    if @question.destroy
      flash[:notice] = "Your question was successfully deleted"
      redirect_to questions_path
    else
      flash.now[:alert] = "There was an error with deleting your question. Please try again."
      render :show
    end
  end
end
