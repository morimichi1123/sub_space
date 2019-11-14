class UsersController < ApplicationController
  before_action :admin_user, only: %i[ edit update destroy]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Space App!"
      redirect_to list_path
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end

    #管理者か確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end