class PostsController < ApplicationController
  def index
    @current_post_page = params[:current_page].to_i ||= 0
    @number_of_posts = Post.all.size
    @displayed_posts = Post.offset(10 * @current_post_page).limit(10).order(created_at: :desc)
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
