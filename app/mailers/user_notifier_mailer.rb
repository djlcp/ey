class UserNotifierMailer < ApplicationMailer
  # send a signup email to the user, pass in the user object that contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up to EY Time' )
  end

   # Recreate one for each email, then create content in corresponding .html.erb file
   # run mailcatcher to test
   # Check: how to call mailers? request.user?

  def send_changed_password_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Your password has been changed' )
  end

  def leave_denied_email(user)
    @user = user
    mail( :to => @request.user.email,
    :subject => 'Your leave request has been denied' )
  end

  def leave_approved_email(user)
    @user = user
    mail( :to => @request.user.email,
    :subject => 'Your leave request has been approved' )
  end

  def leave_revoked_email(user)
    @user = user
    mail(to: @request.user.email, subject: 'You have successfully revoked your leave request' )
  end

  # inform counsellor of leave revoked
  def leave_revoked_email_4cm(request, user)
    @user = user
    @request = request
    mail(
      to: @request.user.counsellor.email,
      subject: 'User has revoked leave request'
    )
  end

  # inform manager of leave revoked
  def leave_revoked_email_4cm(request, user)
    @user = user
    @request = request
    mail(
      to: @request.user.manager.email,
      subject: 'User has revoked leave request'
    )
  end
end
