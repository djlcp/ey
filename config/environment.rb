# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# ActionMailer::Base.smtp_settings = {
#   :user_name => Rails.application.secrets.send_grid_user_name,
#   :password => Rails.application.secrets.send_grid_password,
#   :domain => 'eytm.net',
#   :address => 'smtp.sendgrid.net',
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true
# }