class ApplicationMailer < ActionMailer::Base
  helper :mailer
  default from: 'no-reply.eytm@uk.ey.com'
  layout 'mailer'
end
