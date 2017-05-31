class TopicsController < ApplicationController
  before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_admin, except: [:index, :show]
  before_action :authorize_moderator, only: [:new, :create, :destroy]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      flash[:notice] = "Topic was saved successfully."
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error creating topic. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)

    if @topic.save
      flash[:notice] = "Topic was updated."
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error updating the topic. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
      redirect_to topics_path
    else
      flash.now[:alert] = "There was an error deleting the topic. Please try again."
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end

  def authorize_admin
    unless current_user.admin? || current_user.moderator?
      flash[:alert] = "You must be an admin or a moderator to do that."
      redirect_to topics_path
    end
  end

  def authorize_moderator
    unless current_user.admin? || current_user.member?
      flash[:alert] = "You must me an admin or a member to do that."
      redirect_to topics_path
    end
  end
end
