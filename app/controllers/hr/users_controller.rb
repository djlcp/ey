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
		redirect_to hr_users_path, notice: "user updated"
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

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :role, :admin, :join_date)
	end
end
