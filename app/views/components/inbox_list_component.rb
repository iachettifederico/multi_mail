# frozen_string_literal: true

class InboxListComponent < ApplicationComponent
  def initialize(name: "*Inbox*", inbox:)
    @name = name
    @inbox = inbox
  end

  def template
    div(class: "p-4 border border-2 border-blue-200") {
      h2(class: "m-0 border-b-2  border-blue-100") { name }
      emails.each do |email|
        div {
          span { email.from }
          span { " => " }
          span { email.to }
          span { " | " }
          span { email.subject }
        }
      end
    }
  end

  private

  attr_reader :name

  def emails
    @inbox.emails
  end
end
