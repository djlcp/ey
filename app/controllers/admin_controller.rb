class AdminController < ApplicationController
	before_action :authenticate_user!, :is_admin?

  	def index
  		@users = User.all
	end

	private
	def is_admin?
		unless current_user.admin?
			redirect_to root_url, :alert => "Access Denied"
		end
	end

end
