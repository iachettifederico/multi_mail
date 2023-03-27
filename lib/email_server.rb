class EmailServer
  def self.load
    new
  end

  def create_temporary_accounts(pattern)
  end

  def receive!(emails=[])
    @received_emails.concat(emails)
  end

  def received_emails?
    !received_email_count.zero?
  end

  def received_email_count
    received_emails.count
  end

  def received_emails_for?(account)
    !received_email_count_for(account).zero?
  end

  def received_email_count_for(searched_account)
    received_emails.count { |email|
      email.recipient_account == searched_account
    }
  end

  private

  attr_reader :received_emails

  def initialize
    @received_emails = []
  end
end
