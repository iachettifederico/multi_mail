class AccountGroup

  def initialize
    @account_patterns = []
  end

  def <<(account_pattern)
    @account_patterns << AccountPattern.for(account_pattern)
  end

  def received_emails_from(emails)

    account_patterns.flat_map do |account_pattern|
      account_pattern.matched_emails_from(emails)
    end
  end

  def unreceived_emails_from(emails)
    emails - received_emails_from(emails)
  end

  private

  attr_reader :account_patterns

end
