class PostsController < ApplicationController
before_action :find_posts, only: [:show, :edit, :update, :delete]
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post= Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def delete
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_posts
    @post = Post.find(params[:id])
  end
end
