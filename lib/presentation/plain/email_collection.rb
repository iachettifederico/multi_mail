module Presentation
  module Plain
    class EmailCollection
      def self.for(collection_to_render)
        subclasses.detect { |subclass|
          subclass.for?(collection_to_render)
        }.new(collection_to_render: collection_to_render)
      end

      def render
        subclass_responsibility
      end

      private

      attr_reader :collection_to_render

      def initialize(collection_to_render:)
        @collection_to_render = collection_to_render
      end
    end
  end
end
