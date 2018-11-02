class UserNotifierMailer < ApplicationMailer
  default :from => 'any_from_address@example.com'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up to EY Time' )
  end

 #  recreate one for each email, then create content in corresponding .html.erb file
 # run mailcatcher to test

 # HOW DO I REFER TO A 'USER' WHEN THIS IS NOT SO CLEARLY DEFINED?????????

 def send_changed_password_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Your password has been changed' )
  end

def leave_denied_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Your leave request has been denied' )
  end

def leave_approved_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Your leave request has been approved' )
  end

  def leave_revoked_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'You have successfully revoked your leave request' )
  end

# THIS ONE NEEDS TO GO TO A MANAGER OR COUNCELLOR
  def leave_request_cm_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'New leave request(s)' )
  end





end