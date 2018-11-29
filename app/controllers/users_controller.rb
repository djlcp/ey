# experimenting with a users controller as per demo vid

# Here i was trying to create a csv/xlx download
# class UsersController < ApplicationController
# 	def index
# 		@users = user.request(:name)
# 		respond_to do |format|
# 			format.html
# 			format.csv {send_data text: @usersto_csv}
# 			format.xls {send_data text: @users.to_csv(col_sep: "\t")}
# 		end
# 	end
# end


# This should trigger a signup email
class UsersController < ApplicationController
  # POST /users
  # POST /users.json

  def create
    @user = User.new(params[:user])

 # Question: does the users table automatically have user ids?
 # If so, does the below relate to a single user?

    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.with(user: @user).send_signup_email

        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable }
      end
    end
  end
end

# When leave has councellor and manager approval,
# send the approval mail to (1) manager and (2) counsellor

# 	respond_to do |format|
# 		if @request.save
# 			# Tell mailer to send requests to both manager and counsellor
# 			UserMailer.with(user: @request.user.counsellor, @request.user.manager).leave_request_cm_email
# 			format.html { redirect_to(@user, notice: "Leave Request Submitted")}
# 			format.json { render json: @user.request, status: :created }
# 		else
# 			format.html { render action: 'new' }
# 			format.json { render json: @request.errors, status: :leave_request_not_sent}
# 		end


# # When request.manager_approval and request.counsellor_approval = true, then send approval email
# 	respond_to do |format|
# 		if @request.counsellor_approval = true
# 			and @request.manager_approval = true
# 			UserMailer.with(user: @request.user).leave_approved_email
# 			format.html { redirect_to(@user, notice "Leave Request Approved")}
# 			format.json { render json: @request, status: :approved}
# 		else
# 			format.html { render action: 'new' }
# 			format.json { render json: @request.errors, status:  :approval_not_sent }
# 		end

# # When a request.manager_approval OR request.counsellor_approval = false, then send denied email
# 	respond_to do |format|
# 		if @request.counsellor_approval = false
# 			or @request.manager_approval = false
# 			UserMailer.with(user: @request.user).leave_denied_email
# 			format.html { redirect_to(@user, notice "Leave Request Denied")}
# 			format.json { render json: @request, status: :denied}
# 		else
# 			format.html { render action: 'new' }
# 			format.json { render json: @request.errors, status: :denial_not_sent }
# 		end

# # When a request.revoked = true, then send revoke emails to manager, counsellor and confirm with user
# 	respond_to do |format|
# 		if @request.revoked = true
# 			UserMailer.with(user: @request.user).leave_revoked_email
# 			UserMailer.with(user: @request.user.counsellor).leave_revoked_email_4cm
# 			UserMailer.with(user: @request.user.manager).leave_revoked_email_4cm
# 			format.html { redirect_to(@user, notice "Leave Request Revoked")}
# 			format.json { render json: @request, status: :denied}
# 		else
# 			format.html { render action: 'new' }
# 			format.json { render json: @request.errors, status: :denial_not_sent }
# 		end



# # When a user requests a new password
# # Needs tweaking

# 	respond_to do |format|
# 		if @?????? = true
# 			UserMailer.with(user: @user).send_changed_password_email
# 			format.html { rediresend_changed_password_emailct_to(@user, notice "User has requested new passsword")}
# 			format.json { render json: @?????, status: :new_requested}
# 		else
# 			format.html { render action: 'new' }
# 			format.json { render json: @request.errors, status: :failed_to_request_new_password}
# 		end


# 		respond_to do |format|










