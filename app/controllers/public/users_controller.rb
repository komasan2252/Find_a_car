class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :correct_user, only: [:edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "更新しました"
      redirect_to @user
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @user&.destroy
    flash[:notice] = "退会しました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:family_size, :monthly_mileage)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    redirect_to root_path if current_user != @user
  end
end


