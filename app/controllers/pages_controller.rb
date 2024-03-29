# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    inbox = Inbox.load
    render Pages::HomeView.new(inbox: inbox)
  end
end
