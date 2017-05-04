# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

if ENV['sendgrid_smtp_password']
  ActionMailer::Base.smtp_settings = {
    user_name: 'apikey',
    password: ENV['sendgrid_smtp_password'],
    domain: 'rebooky.com',
    address: 'smtp.sendgrid.net',
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
  }
end
