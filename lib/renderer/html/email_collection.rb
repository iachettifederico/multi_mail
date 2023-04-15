module Renderer
  module Html
    class EmailCollection < Views::Layouts::Partial
      def self.for(emails)
        subclasses.find { |subclass|
          subclass.match_for(emails).
                  new(emails: emails)
        }
      end

      def template
        div {
          p { "Empty" }
        }
      end

      private

      attr_reader :emails

      def initialize(emails:)
        @emails = emails
      end
    end
  end
end
