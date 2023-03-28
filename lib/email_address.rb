class EmailAddress
  attr_reader :address
  attr_reader :account
  attr_reader :domain

  def self.[](address)
    new(address: address)
  end

  private

  def initialize(address:)
    @address = address

    @account, @domain = address.split("@")
  end
end
