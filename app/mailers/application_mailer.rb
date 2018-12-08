class ApplicationMailer < ActionMailer::Base
  helper :mailer
  default from: 'richard.smith@uk.ey.com'
  layout 'mailer'
end
