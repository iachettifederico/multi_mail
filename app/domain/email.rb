# frozen_string_literal: true

class Email
  attr_reader :from
  attr_reader :to
  attr_reader :subject
  attr_reader :body
  attr_reader :message_id
  attr_reader :date

  def self.with(from:, to:, subject:, body:, message_id:, date:)
    new(from: from, to: to, subject: subject, body: body, message_id: message_id, date: date)
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
