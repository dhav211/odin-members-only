class PostsController < ApplicationController
  def index
    @posts = Post.all
    @new_post = Post.new
  end

  def create
    post = Post.new text: params[:post][:text], user: current_user

    if post.save
      flash[:notice] = 'Post was a success!'
    else
      flash[:alert] = 'Post was a failure!'
    end

    redirect_to root_path
  end
end
