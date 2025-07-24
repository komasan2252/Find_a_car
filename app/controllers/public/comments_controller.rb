class Public::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params.merge({post: @post}))
   
    if @comment.save
      flash[:notice] = "投稿しました"
      redirect_to @post
    else
      flash[:alert] = "投稿に失敗しました"
      redirect_to @post
    end
  end

  def destroy
    @post = @comment.post
    @comment&.destroy
    flash[:notice] = "削除しました"
    redirect_to @post
  end

  private

  def comment_params
     params.require(:comment).permit(:body)
  end

  def correct_user
    @comment = current_user.comments.find_by_id(params[:id])
    redirect_to root_path unless @comment
  end
end

