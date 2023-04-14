class Environment
  include AbstractClass

  def self.current
    Environment::Transient.new
  end

  abstract_method :email_receiver
  abstract_method :email_sender

  abstract_method :received_emails

  abstract_method :renderer_for
end
