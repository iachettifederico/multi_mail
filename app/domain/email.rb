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

  def self.not_found
    NotFound.new
  end

  def message_id?(potential_message_id)
    message_id.to_s == potential_message_id.to_s
  end

  def found?
    true
  end

  def found(&block)
    block.call
  end

  def not_found; end

  def ==(other)
    from == other.from       &&
      to == other.to         &&
      subject == other.subject &&
      body == other.body &&
      message_id.to_s == other.message_id.to_s &&
      date == other.date
  end

  private

  def initialize(from:, to:, subject:, body:, message_id:, date:)
    @from       = from
    @to         = to
    @subject    = subject
    @body       = body
    @message_id = message_id.to_s
    @date       = date
  end

  class NotFound
    def found?
      false
    end

    def found; end

    def not_found(&block)
      block.call
    end

    def from = ""
    def to = ""
    def subject = ""
    def body = ""
    def message_id = ""
    def date = ""
  end
end
