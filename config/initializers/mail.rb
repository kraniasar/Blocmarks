ActionMailer::Base.smtp_settings = {
  port:              587,
  address:           'smtp.mailgun.org',
  user_name:         ENV['MAILGUN_SMTP_LOGIN'],
  password:          ENV['MAILGUN_SMTP_PASSWORD'],
  domain:            'https://aqueous-cliffs-81197.herokuapp.com/',
  authentication:    :plain,
  content_type:      'text/html'
}
ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.raise_delivery_errors = true

# Email address to email: app9e55a4325bd54f86be8f2cb8a82cc967.mailgun.org
