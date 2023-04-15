require "spec_helper"

RSpec.describe "email reception" do
  subject(:email_receiver) { environment.email_receiver }

  let(:environment) { Environment.current }
  let(:now) { Time.now }
  let(:email_sender) { environment.email_sender }

  it "shows an empty message if there are no emails" do
    expect(email_receiver).to boolean_count(0, :received_emails)
  end

  it "can receive an email" do
    email_sender.send_email(
      to:   "account@example.com",
      from: "account@test.com",
    )

    expect(email_receiver).to boolean_count(1, :received_emails)
  end

  it "sorts emails by date in descending order" do
    email_sender.send_email(
      to:   "account@example.com",
      from: "account2@test.com",
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

    expected_dates = email_receiver.map(&:date)

    expect(expected_dates).to eql([now + 2, now + 1, now + 0])
    expect(email_receiver).to boolean_count(3, :received_emails)
  end

end
