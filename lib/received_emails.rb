class ReceivedEmails
  def self.load(email_receiver:)
    new(email_receiver: email_receiver)
  end

  def display
    Environment.current.renderer_for(self.class).new(self).display
  end

  def received_emails?
    email_receiver.received_emails?
  end

  def each(&block)
    email_receiver.each(&block)
  end

  private

  attr_reader :email_receiver

  def initialize(email_receiver:)
    @email_receiver = email_receiver
  end
end
