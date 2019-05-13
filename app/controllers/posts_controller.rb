class PostsController < ApplicationController
  before_action :logged_in_user, only:[:new,:create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = 'post Created!'
      redirect_to posts_path
    else
      flash.now[:danger] = 'something went wrong, post not created'
      render 'new'
    end

  end




  private
  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please Login!'
      redirect_to signin_url
    end
  end

  def post_params
    params.require(:post).permit(:title,:content)
  end

end
