class DeviseMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  helper :mailer # gives access to all helpers defined within `mailer_helper`.
  layout 'mailer'
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  # -----------------------------------------
  # Emails that get sent to administrators
  # -----------------------------------------
  # def invitation_instructions(record, token, opts={})
  #   # Mocking some objects as a failsafe
  #   @company = opts.fetch(:company, nil)
  #   @inviter = opts.fetch(:inviter, nil)

  #   if @company && @inviter
  #     opts[:subject] = "You've been invited to join the #{@company.name} Pinpoint"
  #     @opening_line = "#{@inviter.full_name} has invited you to join #{@company.name}’s Pinpoint."
  #   else
  #     opts[:subject] = "You've been invited to join Pinpoint"
  #     @opening_line = "You've been invited to join Pinpoint."
  #   end

  #   super
  # end

  def reset_password_instructions(record, token, opts={})
    super
  end

end
