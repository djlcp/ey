class DeviseMailer < Devise::Mailer
  helper :application
  helper :mailer
  layout 'mailer'
  default template_path: 'devise/mailer'
end
