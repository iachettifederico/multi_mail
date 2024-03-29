# frozen_string_literal: true

class EmailRepository
  attr_reader :emails

  def self.load(emails: InboundEmail.all)
    new(emails: map_emails(emails))
  end

  def find(&block)
    emails.find(&block) || Email.not_found
  end
  
  private

  def initialize(emails:)
    @emails = emails
  end

  def self.map_emails(original_emails)
    original_emails.map { |original_email|
      Email.with(
        from:       original_email.from,
        to:         original_email.to,
        subject:    original_email.subject,
        body:       original_email.body,
        message_id: original_email.message_id,
        date:       original_email.date,
      )
    }
  end
  private_class_method :map_emails
end
