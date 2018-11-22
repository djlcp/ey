class RequestsController < ApplicationController
  def index
  	@requests = Request.all

    respond_to do |format|
        format.json { render :index }      
    end

  end
end
