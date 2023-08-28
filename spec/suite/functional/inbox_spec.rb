# frozen_string_literal: true

require "rails_helper"
require "rspec-given"

RSpec.describe "Inbox" do
  Given(:factory) { Factories::Emails.new }
  Given(:email_repository) { EmailRepository.load(emails: emails) }

  When(:inbox) { Inbox.load(email_repository: email_repository) }

  context "when there are NO emails" do
    Given(:emails) { [] }


    Then { inbox.emails == [] }
    And { inbox.empty? == true }
    And { inbox.number_of_emails == 0 }
  end

  context "when there are emails" do
    context "when there is only one email" do
      Given(:email) { factory.new_email }
      Given(:emails) { [email] }

      Then { inbox.emails == [email] }
      And { inbox.empty? == false }
      And { inbox.number_of_emails == 1 }
    end

    context "when there are multiple emails" do
      Given(:first_email)  { factory.new_email }
      Given(:second_email) { factory.new_email }
      Given(:third_email ) { factory.new_email }
      Given(:emails) { [first_email, second_email, third_email] }

      Then { inbox.emails == [first_email, second_email, third_email] }
      And { inbox.empty? == false }
      And { inbox.number_of_emails == 3 }
    end

    describe "finding emails" do
      Given(:email_to_find) { factory.new_email(message_id: 15) }
      Given(:emails) { [factory.new_email, email_to_find, factory.new_email] }

      context "when found" do
        When(:found_email) { inbox.find_by_message_id("15") }
        
        describe "return value" do
          Then { found_email.found? == true }
        end

        describe "callbacks" do
          When(:found) {
            found_email.found do
              raise "Found"
            end
          }
          When(:not_found) {
            found_email.not_found do
              raise "Not Found"
            end
          }

          Then { found == Failure(RuntimeError, "Found") }
          And { not_found != Failure() }
        end
      end

      context "when NOT found" do
        When(:found_email) { inbox.find_by_message_id("1000") }
        
        describe "return value" do
          Then { found_email.found? == false }
        end

        describe "callbacks" do
          When(:found) {
            found_email.found do
              raise "Found"
            end
          }
          When(:not_found) {
            found_email.not_found do
              raise "Not Found"
            end
          }

          Then { not_found == Failure(RuntimeError, "Not Found") }
          And { found != Failure() }
        end
      end
    end
  end
end
