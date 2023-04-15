require "spec_helper"

RSpec.describe "email reception" do
  let(:environment) { Environment.current }
  let(:now) { Time.now }
  let(:email_sender) { environment.email_sender }

  subject(:received_emails) { environment.received_emails }

  it "is a page" do
    expect(received_emails.display).to have_tag("html>head>title", text: "MultiMail")
    expect(received_emails.display).to have_tag("html>body>main")
  end

  it "shows an empty message if there are no emails" do
    rendered = received_emails.display

    expect(rendered).to have_tag("div", with: { id: "received-emails" }) do
      with_tag("h2", text: "Received Emails")
      with_tag("div") do
        with_tag("span", text: "Empty")
      end
    end
  end

  it "can receive an email" do
    email_sender.send_email(
      to:   "account@example.com",
      from: "account@test.com",
    )

    rendered = received_emails.display

    expect(rendered).not_to have_tag("div#received-emails > div > span", text: "Empty")

    expect(rendered).to have_tag("div", with: { id: "received-emails" }) do
      with_tag("h2", text: "Received Emails")
      with_tag("div") do
        with_tag("span", text: "account@test.com -> account@example.com")
        with_tag("span", text: "account@test.com -> account@example.com")
      end
    end
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

    rendered = received_emails.display

    expect(rendered).to have_tag("div", with: { id: "received-emails" }) do
      with_tag("h2", text: "Received Emails")
      with_tag("div") do
        with_tag("span", text: "account@test.com -> account@example.com")
        with_tag("span", text: "account@test.com -> account2@example.com")
        with_tag("span", text: "account2@test.com -> account@example.com")
      end
    end
  end

end
