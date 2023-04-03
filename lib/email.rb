class Email
  def self.with(from:, to:)
    new(from: from, to: to)
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
  
  def initialize(from:, to:)
    @sender_address   = from
    @receiver_address = to
  end
end
