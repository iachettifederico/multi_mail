require "spec_helper"

RSpec.describe "pattern email accounts" do
  let(:environment) { Environment.current }
  let(:server) { environment.server }

  let(:email_factory) { Factory::Emails.new }

  it "doesn't break if there are no emails" do
    server.create_account_pattern("pepe")

    server.receive!

    expect(server).to boolean_count(0, :received_emails)
    expect(server).to boolean_count(0, :unreceived_emails)
  end

  it "can receive emails for an account" do
    server.create_account_pattern("pepe")

    server.receive!([email_factory.to_pepe, email_factory.to_pepe])

    expect(server).to boolean_count(2, :received_emails)
    expect(server).to boolean_count(0, :unreceived_emails)
  end

  it "is case insensitive" do
    server.create_account_pattern("PepE")

    server.receive!([email_factory.to_pepe, email_factory.to_pepe])

    expect(server).to boolean_count(2, :received_emails)
    expect(server).to boolean_count(0, :unreceived_emails)
  end

  it "it adds new emails to the list if it receives at separate times" do
    server.create_account_pattern("pepe")

    server.receive!([email_factory.to_pepe, email_factory.to_pepe])
    server.receive!([email_factory.to_pepe])

    expect(server).to boolean_count(3, :received_emails)
  end

  it "can unreceive emails sent to an nonexistent account" do
    server.create_account_pattern("pepe1")

    server.receive!([email_factory.to_pepe(suffix: 1)])

    expect(server).to boolean_count(1, :received_emails)
    expect(server).to boolean_count(0, :unreceived_emails)

    expect(server.received_emails_count_for_account("pepe")).to eq(0)
    expect_false(server.received_emails_for_account?("pepe"))

    expect(server.received_emails_count_for_account("pepe1")).to eq(1)
    expect_true(server.received_emails_for_account?("pepe1"))
  end

  it "has unreceived emails if an account haven't been set" do
    server.receive!([email_factory.to_pepe, email_factory.to_pepe])

    expect(server).to boolean_count(0, :received_emails)
    expect(server).to boolean_count(2, :unreceived_emails)
  end

  it "can use a one-character suffix wildcard" do
    server.create_account_pattern("pepe*")

    server.receive!([email_factory.to_pepe, email_factory.to_pepe(suffix: 1)])

    expect(server).to boolean_count(2, :received_emails)
    expect(server).to boolean_count(0, :unreceived_emails)

    expect(server.received_emails_count_for_account("pepe")).to eq(1)
    expect_true(server.received_emails_for_account?("pepe"))

    expect(server.received_emails_count_for_account("pepe1")).to eq(1)
    expect_true(server.received_emails_for_account?("pepe1"))

    expect(server).to boolean_count(0, :unreceived_emails)
  end

  it "can use a multiple-character suffix wildcard" do
    server.create_account_pattern("pepe*")

    server.receive!([email_factory.to_pepe(suffix: "abc")])

    expect(server.received_emails_count_for_account("pepeabc")).to eq(1)
    expect_true(server.received_emails_for_account?("pepeabc"))
  end

  it "can use a multiple-character prefix wildcard" do
    server.create_account_pattern("*pepe")

    server.receive!([email_factory.to_pepe(prefix: "abc")])

    expect(server).to boolean_count(1, :received_emails)

    expect(server.received_emails_count_for_account("abcpepe")).to eq(1)
    expect_true(server.received_emails_for_account?("abcpepe"))
  end

  it "can use a multiple-character prefix and suffix wildcard" do
    server.create_account_pattern("*toto*")

    server.receive!([email_factory.to_toto(prefix: "abc", suffix: "def")])

    expect(server).to boolean_count(1, :received_emails)

    expect(server.received_emails_count_for_account("abctotodef")).to eq(1)
    expect_true(server.received_emails_for_account?("abctotodef"))
  end

  it "can use a multiple-character prefix and suffix wildcard" do
    server.create_account_pattern("*x*x*")

    server.receive!([email_factory.email_to("aaxbbxcc")])

    expect(server).to boolean_count(1, :received_emails)

    expect(server.received_emails_count_for_account("aaxbbxcc")).to eq(1)
    expect_true(server.received_emails_for_account?("aaxbbxcc"))
  end

  it "does something" do
    server.receive!([email_factory.to_pepe, email_factory.to_toto])

    expect(server).to boolean_count(2, :unreceived_emails)
  end

  # TODO: wildcards
  # TODO: fetching all emails
  # TODO: fetching emails for account
  # TODO: reading email content

end
