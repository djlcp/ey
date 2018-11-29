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
   	redirect_to calendar_path
  end

  def show
  end




  private

  def set_request
  	@request = Request.find(params[:id])
  end

  def request_params
  	params.require(:request).permit(:description, :start, :end)
  end
end
