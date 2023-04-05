class EmailSender
  def self.load(emails_repository:)
    new(emails_repository: emails_repository)
  end

  def send_email(to:, from:, date: Time.now)
    emails_repository.add_email(to: to, from: from, date: date)
  end

  private

  attr_reader :emails_repository

  def initialize(emails_repository:)
    @emails_repository = emails_repository
  end
end
