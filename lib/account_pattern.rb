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
    regex_string = [
      '\A',
      pattern.gsub("*", ".*"),
      '\Z',
    ].join

    Regexp.new(regex_string, Regexp::IGNORECASE)
  end

end
