class Environment
  include AbstractClass

  def self.current
    Environment::Transient.new
  end

  abstract_method :email_receiver
  abstract_method :email_sender
end
