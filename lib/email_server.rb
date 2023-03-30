class EmailServer
  def self.load
    new
  end

  def create_account_pattern(pattern)
    raise NotImplementedError
  end
  
  private
  
  def initialize
  end
end
