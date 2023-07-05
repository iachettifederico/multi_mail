email = ActionMailer::Base.mail(
  from: 'sender@example.com',
  to: 'receiver@example.com',
  subject: 'Testing Action Mailbox',
  body: 'Hello, this is a test email.'
)

mailbox = MainMailbox.new
mailbox.process(email)
