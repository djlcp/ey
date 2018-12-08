class Manager::UsersController < ApplicationController
  before_action :authenticate_user!, :is_a_manager?
  before_action :set_start_date, only: [:index]
  before_action :set_end_date, only: [:index]
  before_action :set_approval_status, only: [:index]

  def index
    @users = current_user.managed_users
    requests = current_user.managed_user_requests
    requests = requests.where('start >= :date', date: @start_date) if @start_date
    requests = requests.where('end <= :date', date: @end_date) if @end_date
    requests = requests.send(@approval_status) if @approval_status
    @requests = requests
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

  def set_start_date
    @start_date =
      if params[:start_date].present?
        Date.parse(params[:start_date])
      else
        nil
      end
  end

  def set_end_date
    @end_date =
      if params[:end_date].present?
        Date.parse(params[:end_date])
      else
        nil
      end
  end

  def set_approval_status
    @approval_status =
      if params[:approval_status].present? && params[:approval_status] != 'all'
        params[:approval_status]
      else
        nil
      end
  end
end
