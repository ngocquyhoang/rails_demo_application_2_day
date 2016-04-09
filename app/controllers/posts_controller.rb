class PostsController < ApplicationController
  before_action :authenticate_user?, :except => [:show, :index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.reverse
  end

  def show
    if user_signed_in?
      @comment = Comment.new
    end
  end

  def new
    @post = Post.new
  end

  def edit
    if @post.user.id != current_user.id
      flash[:error] = "Denied Access"
      redirect_to root_path
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id 
    if @post.save
      flash[:success] = "Post was successfully created"
      redirect_to @post
    else
      flash.now[:error] = @post.errors
      render 'new'
    end
  end

  def update
    if @post.user.id == current_user.id
      if @post.update(post_params)
        flash[:success] = "Post was successfully updated."
        redirect_to @post
      else
        flash.now[:error] = @post.errors
        render 'edit'
      end
    else
      flash[:error] = "Denied Access"
      redirect_to root_path
    end
  end

  def delete_post
    if user_signed_in?
      post = current_user.posts.find(params[:post_id]) 
      if post
        post.destroy
        render json:{status: "success" }
      else
        render json:{status: "error" }
      end
    else
      render json:{status: "error" }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
