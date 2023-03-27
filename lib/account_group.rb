class AccountGroup

  def initialize
    @account_patterns = []
  end

  def <<(account_pattern)
    @account_patterns << account_pattern
  end

  def received_emails_from(emails)
    response = []
    emails.each do |email|
      account_patterns.each do |account_pattern|
        response << email if email.recipient_account == account_pattern
      end
    end

    response
  end

  def unreceived_emails_from(emails)
    emails - received_emails_from(emails)
  end

  private

  attr_reader :account_patterns

end
