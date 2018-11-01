class UserNotifierMailer < ApplicationMailer
  default :from => 'any_from_address@example.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up to EY Time' )
  end


 #  recreate one for each email, then create content in user_signup_email.html.erb
 # run mailcatcher to test
 # Q: why does the second not run? - undefined method?
 def send_changed_password_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Your password has been changed' )
  end




end