class FavoritesController < ApplicationController
  before_action :require_sign_in

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    if favorite.save
      flash[:notice] = "Post favrorited."
    else
      flash[:alert] = "There was an error favoriting the post."
    end
    redirect_to [post.topic, post]
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Post unfavorited"
    else
      flash[:alert] = "There was an error unfavoriting the post"
    end
    redirect_to [post.topic, post]
  end
end
