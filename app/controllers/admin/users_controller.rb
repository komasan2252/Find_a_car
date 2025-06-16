class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user&.destroy
    redirect_to admin_users_path
  end
end
