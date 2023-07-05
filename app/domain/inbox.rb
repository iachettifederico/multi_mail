# frozen_string_literal: true

class Inbox
  def self.load(email_repository: EmailsRepository.load)
    new(email_repository: email_repository)
  end

  def emails
    email_repository.emails
  end

  private

  attr_reader :email_repository

  def initialize(email_repository:)
    @email_repository = email_repository
  end
end
