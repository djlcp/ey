class ApplicationMailer < ActionMailer::Base
  helper :mailer
  default from: 'admin@eytm.net'
  layout 'mailer'
end
