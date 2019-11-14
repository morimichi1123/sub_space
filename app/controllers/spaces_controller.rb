class SpacesController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, only: %i[ edit update destroy]

  def new
    @space = Space.new
  end

  def edit
    @space = Space.find(params[:id])
  end

  def update
  end

  def create
    @space = Space.find(params[:id])
    if @space.update_attributes(space_params)
      flash[:success] = "Space Information Updated"
      redirect_to @space
    else
      render 'edit'
    end
  end

  def space_params
    params.require(:space).permit(:space_name, :ward_id, :price)
  end

  def show
    @space = Space.find(params[:id])
  end

  def list
    @space = Space.paginate(page: params[:page]).search(params[:search])
  end

  def destroy
  end

  private
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # 管理者かどうか確認
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
