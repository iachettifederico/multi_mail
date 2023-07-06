# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Inbox" do
  let(:factory) { Factories::Emails.new }

  it "starts empty" do
    email_repository = EmailRepository.load(emails: [])

    inbox = Inbox.load(email_repository: email_repository)

    expect(inbox.emails).to eq([])
    expect(inbox.empty?).to be(true)
    expect(inbox.number_of_emails).to eq(0)
  end

  it "lists one email" do
    email = factory.new_email
    email_repository = EmailRepository.load(emails: [email])

    inbox = Inbox.load(email_repository: email_repository)

    expect(inbox.emails).to eq([email])
    expect(inbox.empty?).to be(false)
    expect(inbox.number_of_emails).to eq(1)
  end

  it "lists multiple email" do
    first_email  = factory.new_email
    second_email = factory.new_email
    third_email  = factory.new_email
    email_repository = EmailRepository.load(emails: [first_email, second_email, third_email])

    inbox = Inbox.load(email_repository: email_repository)

    expect(inbox.emails).to eq([first_email, second_email, third_email])
    expect(inbox.empty?).to be(false)
    expect(inbox.number_of_emails).to eq(3)
  end

  it "returns an email from the email id" do
    email = factory.new_email(message_id: 15)
    email_repository = EmailRepository.load(emails: [factory.new_email, email, factory.new_email])

    inbox = Inbox.load(email_repository: email_repository)

    email = inbox.find_by_message_id("15")

    expect(email.found?).to be(true)
    expect(email.message_id).to eq("15")
    email.found { @found = true }
    email.not_found { raise }
    expect(@found).to be(true)
  end

  it "returns an email null object if the email wasn't found" do
    email = factory.new_email(message_id: 15)
    email_repository = EmailRepository.load(emails: [factory.new_email, email, factory.new_email])

    inbox = Inbox.load(email_repository: email_repository)

    email = inbox.find_by_message_id("not found")

    expect(email.found?).to be(false)
    expect(email.message_id).to eq("")
    email.found { raise }
    email.not_found { @found = false }
    expect(@found).to be(false)
  end

end
