# frozen_string_literal: true

class Inbox
  def self.load(email_repository: EmailsRepository.load)
    new(email_repository: email_repository)
  end

  delegate :emails, to: :email_repository

  private

  attr_reader :email_repository

  def initialize(email_repository:)
    @email_repository = email_repository
  end
end
