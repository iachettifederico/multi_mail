class EmailReceiver
  def self.load(emails_repository:)
    new(emails_repository: emails_repository)
  end

  def receive!
  end

  def received_emails
    emails_repository.all
  end

  boolean_count :received_emails

  private

  attr_reader :emails_repository

  def initialize(emails_repository:)
    @emails_repository = emails_repository
  end
end
