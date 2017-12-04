# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# SMTP settings for mailgun
ActionMailer::Base.smtp_settings = {
  :port           => ENV['mailgun_smtp_port'],
  :address        => ENV['mailgun_smtp_server'],
  :domain         => ENV['infinite-dawn-44011.herokuapp.com'],
  :user_name      => ENV['mailgun_smtp_login'],
  :password       => ENV['mailgun_smtp_password'],
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp
}
