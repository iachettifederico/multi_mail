class Environment
  class Transient < Environment

    def received_emails
      @received_emails ||= ReceivedEmails.load(email_receiver: email_receiver)
    end

    def renderer_for(rendered_class)
      @renderer_for ||= Renderer::Html::ReceivedEmails
    end

    def email_receiver
      @email_receiver ||= EmailReceiver.load(emails_repository: emails_repository)
    end

    def email_sender
      @email_sender ||= EmailSender.load(emails_repository: emails_repository)
    end

    private

    attr_reader :emails_repository

    def initialize
      @emails_repository = EmailsRepository.load
    end
  end
end
