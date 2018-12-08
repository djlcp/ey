class ApplicationMailer < ActionMailer::Base
  helper :mailer
  default from: 'no-reply@eytm.net'
  layout 'mailer'
end
