module Presentation
  module Plain
    class EmailCollection

      include AbstractClass

      abstract_method :render

      def self.for(collection_to_render)
        subclasses.detect { |subclass|
          subclass.for?(collection_to_render)
        }.new(collection_to_render: collection_to_render)
      end

      private

      attr_reader :collection_to_render

      def initialize(collection_to_render:)
        @collection_to_render = collection_to_render
      end
    end
  end
end
