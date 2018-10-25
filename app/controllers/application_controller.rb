class UsersController < ApplicationController
  def create
    # Create the user from params
    @user = User.new(params[:user])
    if @user.save
      # Deliver the signup email
      UserNotifier.send_signup_email(@user).deliver
      redirect_to(@user, :notice => 'User created')
    else
      render :action => 'new'
    end
  end
end