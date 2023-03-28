class AccountPattern
  def self.for(pattern)
    new(pattern: pattern)
  end

  def match?(account)
    pattern == account
  end

  private

  attr_reader :pattern

  def initialize(pattern:)
    @pattern = pattern
  end
end
