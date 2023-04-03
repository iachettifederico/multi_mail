require "spec_helper"

RSpec.describe "email reception" do
  let(:environment) { Environment.current }

  it "doesn't break if there are no emails" do
    email_receiver = environment.email_receiver

    email_receiver.receive!

    expect(email_receiver).to boolean_count(0, :received_emails)
  end

  it "does something" do
    email_sender = environment.email_sender
    email_receiver = environment.email_receiver
    email_sender.send_email(
      to: "account@example.com",
      from: "account@test.com",
    )

    email_receiver.receive!

    received_email = email_receiver.received_emails.first
    expect(email_receiver).to boolean_count(1, :received_emails)
    expect_true(received_email.receiver?("account@example.com"))
    expect_true(received_email.sender?("account@test.com"))
  end

  it "does something" do
    email_sender = environment.email_sender
    email_receiver = environment.email_receiver
    email_sender.send_email(
      to: "account@example.com",
      from: "account@test.com",
    )
    email_sender.send_email(
      to: "account2@example.com",
      from: "account@test.com",
    )

    email_receiver.receive!

    received_email = email_receiver.received_emails.first
    expect(email_receiver).to boolean_count(2, :received_emails)
    expect_true(received_email.receiver?("account2@example.com"))
    expect_true(received_email.sender?("account@test.com"))
  end

end
