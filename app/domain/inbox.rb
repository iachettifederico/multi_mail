# frozen_string_literal: true

class Inbox
  def self.load(email_repository: EmailRepository.load)
    new(email_repository: email_repository)
  end

  delegate :emails, to: :email_repository

  def number_of_emails
    emails.count
  end

  def empty?
    !emails.count.positive?
  end

  def find_by_message_id(message_id)
    email_repository.find { |email|
      email.message_id?(message_id)
    }
  end

  private

  attr_reader :email_repository

  def initialize(email_repository:)
    @email_repository = email_repository
  end
end
