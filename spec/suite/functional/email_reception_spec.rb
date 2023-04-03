require "spec_helper"

RSpec.describe "email reception" do
  let(:environment) { Environment.current }

  let(:email_factory) { Factory::Emails.new }

  it "doesn't break if there are no emails" do
  end

end
