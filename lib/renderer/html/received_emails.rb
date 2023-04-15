module Renderer
  module Html
    class ReceivedEmails < Views::Layouts::Page
      alias :display :call

      def initialize(received_emails)
        @received_emails = received_emails
      end

      def template
        div(id: "received-emails") {
          h2 { "Received Emails" }

          if received_emails.received_emails?
            div {
              received_emails.each do |email|
                span { "#{email.sender_address} -> #{email.receiver_address}" }
              end
            }
          else
            div {
              span { "Empty" }
            }
          end
        }
      end

      private

      attr_reader :received_emails
    end
  end
end
