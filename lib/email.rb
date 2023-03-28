class Email
  def self.from_attributes(to:, from:, subject:, body:)
    new(to: to)
  end

  def self.from_file(path)
    raise NotImplemented
  end

  def recipient_account
    recipient_email.account
  end
  
  def recipient_account?(account)
    @recipient_email.account == account
  end

  private

  attr_reader :recipient_email

  def initialize(to:)
    @recipient_email = EmailAddress[to]
  end
end
