# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings =   {
  :address            => 'mail.communs.fr',
  :port               => 465,
  :domain             => 'mail.communs.fr',
  :authentication     => :plain,
  :user_name          => ENV['mail_login'],
  :password           => ENV['mail_pwd'],
  tls:                  true,
  enable_starttls_auto: true,
  :openssl_verify_mode  => 'none'
}