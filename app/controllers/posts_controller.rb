class PostsController < ApplicationController

  def index
    @posts = Post.all.order('created_at DESC').limit(10)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end

end
