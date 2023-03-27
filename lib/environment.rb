class Environment
  def self.current
    Environment::Transient.new
  end

  def server
    subclass_responsibility
  end
end
