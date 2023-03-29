class AccountPattern
  def self.for(pattern)
    new(pattern: pattern)
  end

  def matched_emails_from(emails)
    emails.select { |email|
      match?(email)
    }
  end

  private

  attr_reader :pattern

  def initialize(pattern:)
    @pattern = pattern
  end

  def match?(email)
    regex =~ email.recipient_account
  end

  def regex
    Regexp.new(pattern.gsub("*", ".?"), Regexp::IGNORECASE)
  end

end
