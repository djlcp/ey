class Manager::RequestsController < ApplicationController
  before_action :authenticate_user!, :is_a_manager?

  def index
    @requests = current_user.managed_user_requests.approved
    respond_to do |format|
      format.json { render 'requests/index' }
    end
  end

  private

  def is_a_manager?
    unless current_user.admin? || current_user.is_manager?
      redirect_to root_url, alert: 'Access Denied'
    end
  end
end
