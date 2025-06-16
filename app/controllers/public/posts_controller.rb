class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to @post
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    @user = @post.user
  end

  def update
    @user = @post.user
    if @post.update(post_params)
      flash[:notice] = "更新しました"
      redirect_to @post
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @post&.destroy
    flash[:notice] = "削除しました"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:maker_id, :genre_id, :car_name, :year_name, :year_number, :good_point, :bad_point, :fuel_efficiency, :riding_capacity, :star, :car_image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def correct_user
    @post = current_user.posts.find_by_id(params[:id])
    redirect_to root_path unless @post
  end
end


