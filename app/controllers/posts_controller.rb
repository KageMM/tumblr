class PostsController < ApplicationController
before_action :find_posts, only: [:show]
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.save

    redirect_to @post
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_posts
    @post = Post.find(params[:id])
  end
end
