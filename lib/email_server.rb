class EmailServer
  def self.load
    new
  end

  def create_temporary_account_pattern(pattern)
    @account_group << AccountPattern.for(pattern)
  end

  def receive!(emails=[])
    @received_emails.concat(account_group.received_emails_from(emails))
    @unreceived_emails.concat(account_group.unreceived_emails_from(emails))
  end

  def received_emails?
    !received_email_count.zero?
  end

  def received_email_count
    received_emails.count
  end

  def unreceived_emails?
    !unreceived_email_count.zero?
  end

  def unreceived_email_count
    unreceived_emails.count
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
  attr_reader :unreceived_emails
  attr_reader :account_group

  def initialize
    @received_emails = []
    @unreceived_emails = []
    @account_group = AccountGroup.new
  end
end
