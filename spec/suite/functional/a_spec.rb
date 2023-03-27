require "spec_helper"

RSpec.describe "temporal email accounts" do
  let(:environment) { Environment.current }

  let(:email_factory) { Factory::Emails.new }

  it "does something" do
    server = environment.server

    server.create_temporary_accounts("temp")

    server.receive!

    expect_false(server.received_emails?)
    expect(server.received_email_count).to eq(0)
  end

  it "something" do
    server = environment.server

    server.create_temporary_accounts("temp")

    server.receive!([email_factory.to_temp, email_factory.to_temp])

    expect_true(server.received_emails?)
    expect(server.received_email_count).to eq(2)
  end

  it "something" do
    server = environment.server

    server.create_temporary_accounts("temp")

    server.receive!([email_factory.to_temp, email_factory.to_temp])
    server.receive!([email_factory.to_temp])

    expect_true(server.received_emails?)
    expect(server.received_email_count).to eq(3)
  end

  it "something" do
    server = environment.server

    server.create_temporary_accounts("temp")

    server.receive!([email_factory.to_temp(1)])

    expect_true(server.received_emails?)
    expect(server.received_email_count).to eq(1)

    expect_false(server.received_emails_for?("temp"))
    expect(server.received_email_count_for("temp")).to eq(0)

    expect_true(server.received_emails_for?("temp1"))
    expect(server.received_email_count_for("temp1")).to eq(1)
  end

end
