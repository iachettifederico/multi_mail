class Environment
  class Transient < Environment

  end

  def server
    EmailServer.load
  end
end
