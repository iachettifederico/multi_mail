# frozen_string_literal: true

module Pages
  class HomeView < ApplicationView
    def initialize(inbox:)
      @inbox = inbox
    end

    def template
      h1 { "Home Page" }

      render InboxListComponent.new(name: "All emails", inbox: @inbox)
    end
  end
end
