module AbstractClass
  def self.included(base)
    base.extend(ClassMethods)
  end
  module ClassMethods
    def abstract_method(*names)
      definitor = self

      names.each do |name|
        define_method name do |*args|
          raise SubclassResponsibility,
                "Called unimplemented abstract method #{self.class}##{name} " +
                "(defined in #{definitor.class.name.downcase} #{definitor})."
        end
      end
    end
  end
end

SubclassResponsibility = Class.new(StandardError)
