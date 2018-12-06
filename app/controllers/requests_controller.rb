class RequestsController < ApplicationController
  before_action :set_request, only: [:show]

  def index
    @requests = Request.all
    respond_to do |format|
      format.json { render :index }
    end
  end

  def new
    type_param = params[:type]
    leave_type = type_param if type_param.in?(Request.leave_types.keys)
    @request = Request.new(leave_type: leave_type)
  end

  def create
    @request = current_user.requests.new(request_params)
    if @request.save
      current_user.send_request_approval_emails(@request)
      redirect_to root_path
    else
      render :new
    end
  end


  def show; end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  private

  def request_params
    params.require(:request).permit(:start, :end, :description, :leave_type)
  end
end
