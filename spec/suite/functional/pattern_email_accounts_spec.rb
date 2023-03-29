require "spec_helper"

RSpec.describe "pattern email accounts" do
  let(:environment) { Environment.current }

  let(:email_factory) { Factory::Emails.new }

  it "doesn't break if there are no emails" do
    server = environment.server

    server.create_account_pattern("pepe")

    server.receive!

    expect(server.received_emails_count).to eq(0)
    expect_false(server.received_emails?)

    expect(server.unreceived_emails_count).to eq(0)
    expect_false(server.unreceived_emails?)
  end

  it "can receive emails for an account" do
    server = environment.server

    server.create_account_pattern("pepe")

    server.receive!([email_factory.to_pepe, email_factory.to_pepe])

    expect(server.received_emails_count).to eq(2)
    expect_true(server.received_emails?)

    expect(server.unreceived_emails_count).to eq(0)
    expect_false(server.unreceived_emails?)
  end

  it "is case insensitive" do
    server = environment.server

    server.create_account_pattern("PepE")

    server.receive!([email_factory.to_pepe, email_factory.to_pepe])

    expect(server.received_emails_count).to eq(2)
    expect_true(server.received_emails?)

    expect(server.unreceived_emails_count).to eq(0)
    expect_false(server.unreceived_emails?)
  end

  it "it adds new emails to the list if it receives at separate times" do
    server = environment.server

    server.create_account_pattern("pepe")

    server.receive!([email_factory.to_pepe, email_factory.to_pepe])
    server.receive!([email_factory.to_pepe])

    expect(server.received_emails_count).to eq(3)
    expect_true(server.received_emails?)
  end

  it "can unreceive emails sent to an nonexistent account" do
    server = environment.server

    server.create_account_pattern("pepe1")

    server.receive!([email_factory.to_pepe(suffix: 1)])

    expect(server.received_emails_count).to eq(1)
    expect_true(server.received_emails?)

    expect(server.received_emails_count_for_account("pepe")).to eq(0)
    expect_false(server.received_emails_for_account?("pepe"))

    expect(server.received_emails_count_for_account("pepe1")).to eq(1)
    expect_true(server.received_emails_for_account?("pepe1"))
  end

  it "has unreceived emails if an account haven't been set" do
    server = environment.server

    server.receive!([email_factory.to_pepe, email_factory.to_pepe])

    expect(server.received_emails_count).to eq(0)
    expect_false(server.received_emails?)

    expect(server.unreceived_emails_count).to eq(2)
    expect_true(server.unreceived_emails?)
  end

  it "can use a one-character suffix wildcard" do
    server = environment.server

    server.create_account_pattern("pepe*")

    server.receive!([email_factory.to_pepe, email_factory.to_pepe(suffix: 1)])

    expect(server.received_emails_count).to eq(2)
    expect_true(server.received_emails?)

    expect(server.received_emails_count_for_account("pepe")).to eq(1)
    expect_true(server.received_emails_for_account?("pepe"))

    expect(server.received_emails_count_for_account("pepe1")).to eq(1)
    expect_true(server.received_emails_for_account?("pepe1"))

    expect(server.unreceived_emails_count).to eq(0)
    expect_false(server.unreceived_emails?)
  end

  it "can use a multiple-character suffix wildcard" do
    server = environment.server

    server.create_account_pattern("pepe*")

    server.receive!([email_factory.to_pepe(suffix: "abc")])

    expect(server.received_emails_count_for_account("pepeabc")).to eq(1)
    expect_true(server.received_emails_for_account?("pepeabc"))
  end

  it "can use a multiple-character prefix wildcard" do
    server = environment.server

    server.create_account_pattern("*pepe")

    server.receive!([email_factory.to_pepe(prefix: "abc")])

    expect(server.received_emails_count).to eq(1)
    expect_true(server.received_emails?)

    expect(server.received_emails_count_for_account("abcpepe")).to eq(1)
    expect_true(server.received_emails_for_account?("abcpepe"))
  end

  it "can use a multiple-character prefix and suffix wildcard" do
    server = environment.server

    server.create_account_pattern("*toto*")

    server.receive!([email_factory.to_toto(prefix: "abc", suffix: "def")])

    expect(server.received_emails_count).to eq(1)
    expect_true(server.received_emails?)

    expect(server.received_emails_count_for_account("abctotodef")).to eq(1)
    expect_true(server.received_emails_for_account?("abctotodef"))
  end


  
  # *temp
  # *temp*

  # TODO: wildcards
  # TODO: fetching all emails
  # TODO: fetching emails for account
  # TODO: reading email content

end
