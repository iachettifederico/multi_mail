# frozen_string_literal: true

class Email
  def self.with(from:, to:, subject:, body:, message_id:, date:)
    new(from: from, to: to, subject: subject, body: body)
  end

  private

  def initialize(from:, to:, subject:, body:, message_id:, date:)
    @from       = from
    @to         = to
    @subject    = subject
    @body       = body
    @message_id = message_id
    @date       = date
  end
end
