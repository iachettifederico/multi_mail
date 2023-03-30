class EmailServer
  def self.load
    new
  end

  def create_account_pattern(pattern)
  end

  def receive!(new_emails=[])
    @received_emails = new_emails
  end

  def render_received_emails
    Presentation::Plain::EmailCollection.for(received_emails).render
    
  end

  private

  attr_reader :received_emails

  def initialize
    @received_emails = []
  end
end
