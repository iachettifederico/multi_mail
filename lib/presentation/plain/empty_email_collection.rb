module Presentation
  module Plain
    class EmptyEmailCollection < Presentation::Plain::EmailCollection

      def self.for?(collection)
        collection.empty?
      end
      
      def render
        <<~PLAIN
          Received Emails:
            Empty
        PLAIN
      end

    end
  end
end
