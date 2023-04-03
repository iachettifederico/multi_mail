class Environment
  class Transient < Environment

  end

  def email_receiver
    EmailReceiver.load(emails_repository: emails_repository)
  end

  def email_sender
    EmailSender.load(emails_repository: emails_repository)
  end

  private

  attr_reader :emails_repository

  def initialize
    @emails_repository = EmailsRepository.load
  end
end
