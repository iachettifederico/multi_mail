require "spec_helper"

RSpec.describe "email reception" do
  let(:environment) { Environment.current }
  let(:now) { Time.now }

  it "doesn't break if there are no emails" do
    email_receiver = environment.email_receiver

    expect(email_receiver).to boolean_count(0, :received_emails)
  end

  it "can receive an email" do
    email_sender = environment.email_sender
    email_receiver = environment.email_receiver
    email_sender.send_email(
      to:   "account@example.com",
      from: "account@test.com",
    )

    received_email = email_receiver.received_emails.first
    expect(email_receiver).to boolean_count(1, :received_emails)
    expect_true(received_email.receiver?("account@example.com"))
    expect_true(received_email.sender?("account@test.com"))
  end

  it "sorts emails by date in descending order" do
    email_sender = environment.email_sender
    email_receiver = environment.email_receiver
    email_sender.send_email(
      to:   "account@example.com",
      from: "account@test.com",
      date: now + 2,
    )
    email_sender.send_email(
      to:   "account@example.com",
      from: "account@test.com",
      date: now + 0,
    )
    email_sender.send_email(
      to:   "account2@example.com",
      from: "account@test.com",
      date: now + 1,
    )

    received_email_dates = email_receiver.received_emails.map(&:date)
    expect(email_receiver).to boolean_count(3, :received_emails)
    expect(received_email_dates[0]).to eq(now + 2)
    expect(received_email_dates[1]).to eq(now + 1)
    expect(received_email_dates[2]).to eq(now + 0)
  end

end
