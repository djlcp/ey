class RequestsController < ApplicationController
	before_action :set_request, only: [:show,]
  def index
  	@requests = Request.all
    respond_to do |format|
		format.json { render :index }
    end
  end

  def new
  	@request = Request.new
  end

  def create
  	@request = Request.new(request_params)
   	@request.save
   	redirect_to root_path
  end

  def show
  end




  private

  def set_request
  	@request = Request.find(params[:id])
  end

  def request_params
  	params.require(:request).permit(:description, :start, :end)
  	@request = Request.new(request_params.merge(user: current_user))
  	if @request.save
  		leave_request_cm_email(request.current_user.manager)
  		leave_request_cm_email(current_user.counsellor)
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  private

  def request_params
  	params.require(:request).permit(:start, :end, :description, :leave_type)
  end
end
