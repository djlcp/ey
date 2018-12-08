class Hr::UsersController < ApplicationController
  before_action :authenticate_user!, :is_hr?

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to hr_users_path, notice: 'User Updated'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to hr_users_path, notice: 'User Deleted'
  end

  private

  def is_hr?
    unless current_user.admin? || current_user.hr?
      redirect_to root_url, alert: 'Access Denied'
    end
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :role,
      :admin,
      :is_manager,
      :join_date,
      :manager_id,
      :counsellor_id
    )
  end
end
