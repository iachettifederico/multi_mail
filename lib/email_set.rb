class EmailSet
  def self.[]
    new
  end

  def concat(new_emails)
    emails.concat(new_emails)
  end

  def count
    @emails.count
  end

  def count_for_account(searched_account)
    emails.count { |email|
      email.recipient_account?(searched_account)
    }
  end

  private

  attr_reader :emails

  def initialize
    @emails = []
  end
end
