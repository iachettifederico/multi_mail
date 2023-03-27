class Email
  attr_reader :recipient_account

  def self.from_attributes(to:, from:, subject:, body:)
    new(to: to)
  end

  def self.from_file(path)
    raise NotImplemented
  end

  private

  attr_reader :recipient_email

  def initialize(to:)
    @recipient_email = to
    @recipient_account = account_from(recipient_email)
  end

  def account_from(a_recipient_email)
    a_recipient_email[/(.+)@.+/, 1]
  end
end
