class EmailReceiver
  def self.load(emails_repository:)
    new(emails_repository: emails_repository)
  end

  def received_emails
    emails_repository.all
  end

  boolean_count :received_emails

  def each(&block)
    emails_repository.each(&block)
  end

  private

  attr_reader :emails_repository

  def initialize(emails_repository:)
    @emails_repository = emails_repository
  end
end
