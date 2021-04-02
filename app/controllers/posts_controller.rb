class PostsController < ApplicationController
  def show
    set_post
  end

  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    set_post
  end

  def update
    set_post
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    # binding.pry
    # params.require(:post).permit(:title, :category, :content)
    params.permit(:title, :category, :content)
  end
end
