class Manager::UsersController < ApplicationController
  before_action :authenticate_user!, :is_a_manager?

  def index
    @users = current_user.managed_users
  end

  def show
    @user = current_user.managed_users.find(params[:id])
  end

  private

  def is_a_manager?
    unless current_user.admin? || current_user.is_manager?
      redirect_to root_url, alert: 'Access Denied'
    end
  end
end
