require "spec_helper"

RSpec.describe "pattern email accounts" do
  let(:environment) { Environment.current }

  let(:email_factory) { Factory::Emails.new }

  it "doesn't break if there are no emails" do
    server = environment.server

    server.create_temporary_account_pattern("temp")

    server.receive!

    expect(server.received_emails_count).to eq(0)
    expect_false(server.received_emails?)

    expect(server.unreceived_emails_count).to eq(0)
    expect_false(server.unreceived_emails?)
  end

  it "can receive emails for an account" do
    server = environment.server

    server.create_temporary_account_pattern("temp")

    server.receive!([email_factory.to_temp, email_factory.to_temp])

    expect(server.received_emails_count).to eq(2)
    expect_true(server.received_emails?)

    expect(server.unreceived_emails_count).to eq(0)
    expect_false(server.unreceived_emails?)
  end

  it "it adds new emails to the list if it receives at separate times" do
    server = environment.server

    server.create_temporary_account_pattern("temp")

    server.receive!([email_factory.to_temp, email_factory.to_temp])
    server.receive!([email_factory.to_temp])

    expect(server.received_emails_count).to eq(3)
    expect_true(server.received_emails?)
  end

  it "can unreceive emails sent to an nonexistent account" do
    server = environment.server

    server.create_temporary_account_pattern("temp1")

    server.receive!([email_factory.to_temp(1)])

    expect(server.received_emails_count).to eq(1)
    expect_true(server.received_emails?)

    expect(server.received_emails_count_for_account("temp")).to eq(0)
    expect_false(server.received_emails_for_account?("temp"))

    expect(server.received_emails_count_for_account("temp1")).to eq(1)
    expect_true(server.received_emails_for_account?("temp1"))
  end

  it "has unreceived emails if an account haven't been set" do
    server = environment.server

    server.receive!([email_factory.to_temp, email_factory.to_temp])

    expect_false(server.received_emails?)
    expect(server.received_emails_count).to eq(0)

    expect_true(server.unreceived_emails?)
    expect(server.unreceived_emails_count).to eq(2)
  end

  # TODO: wildcards
  # TODO: fetching all emails
  # TODO: fetching emails for account
  # TODO: reading email content

end
