# experimenting with a users controller as per demo vid

class UsersController < ApplicationController
	def index 
		@users = user.request(:name)
		respond_to do |format|
			format.html
			format.csv {send_data text: @usersto_csv}
			format.xls {send_data text: @users.to_csv(col_sep: "\t")}
		end
	end
end



