class PostsController < ApplicationController
  def new
	@post = Post.new
  end

  def index
    @post = Post.all.reverse
  end

  def show
    @post = Post.find(params[:id])
  end

  def list
    @post = Post.where(user: params[:user]).reverse
  end

  def create
    @post = Post.new(permit_post)
    if @post.save
      flash[:success] = "Success!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end
  private
    def permit_post
      params.require(:post).permit(:image,:description,:user)
    end
end
