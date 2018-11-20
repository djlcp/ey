class Hr::UsersController < ApplicationController
	before_action :authenticate_user!, :is_hr?

  	def index
  		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to hr_users_path, notice: "user deleted"
	end

	private
	def is_hr?
		unless current_user.admin? or current_user.hr?
			redirect_to root_url, :alert => "Access Denied"
		end
	end

end
