class EmailsRepository
  def self.load
    new
  end

  def add_email(from:, to:, date:)
    @emails << Email.new(from: from, to: to, date: date)
    @emails = @emails.sort_by { |email| -email.date.to_i }
  end

  def all
    @emails
  end

  def each(&block)
    @emails.each(&block)
  end

  private

  def initialize
    @emails = []
  end
end
