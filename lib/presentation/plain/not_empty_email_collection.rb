module Presentation
  module Plain
    class NotEmptyEmailCollection < Presentation::Plain::EmailCollection

      def self.for?(collection)
        !collection.empty?
      end

      def render
        <<~PLAIN
          Received Emails:
            #1
            To:      pepe@example.com
            From:    external@test.com
            Subject: Email for pepe
        PLAIN
      end
    end
  end
end
