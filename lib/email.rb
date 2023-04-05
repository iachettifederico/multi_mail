class Email
  attr_reader :date

  def self.with(from:, to:, date:)
    new(from: from, to: to, date: date)
  end

  def receiver?(potential_address)
    potential_address == receiver_address
  end

  def sender?(potential_address)
    potential_address == sender_address
  end

  private

  attr_reader :sender_address
  attr_reader :receiver_address

  def initialize(from:, to:, date:)
    @sender_address   = from
    @receiver_address = to
    @date             = date
  end
end
