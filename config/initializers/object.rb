class Object
  def self.boolean_count(attr)
    define_method("#{attr}_count") do
      send(attr).count
    end

    define_method("#{attr}?") do
      public_send("#{attr}_count").positive?
    end
  end

  def subclass_responsibility
    raise StandardError, "Subclass responsibility"
  end
end
