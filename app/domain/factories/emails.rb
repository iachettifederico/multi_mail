# frozen_string_literal: true

# TODO: Email ids should be plain strings

module Factories
  class Emails
    def initialize
      @message_id = 1
    end

    def new_email(from: generate_from, to: generate_to,
                  subject: generate_subject, body: generate_body,
                  date: Time.current, message_id: @message_id)
      email = Email.with(
        from:       from,
        to:         to,
        subject:    subject,
        body:       body,
        message_id: message_id,
        date:       date,
      )

      next_email

      email
    end

    private

    attr_reader :message_id

    def generate_from
      "from#{message_id}@example.com"
    end

    def generate_to
      "to#{message_id}@example.com"
    end

    def generate_subject
      "Subject #{message_id}"
    end

    def generate_body
      "Body #{message_id}"
    end

    def next_email
      @message_id += 1
    end
  end
end
