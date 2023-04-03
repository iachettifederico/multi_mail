class EmailsRepository
  def self.load
    new
  end

  def add_email(from:, to:)
    @emails << Email.new(from: from, to: to)
  end

  def all
    @emails
  end
  
  private

  def initialize
    @emails = []
  end
end
