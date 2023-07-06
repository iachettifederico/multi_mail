# frozen_string_literal: true

class NavBarItemComponent < ApplicationComponent
  attr_reader :text
  attr_reader :url
  attr_reader :target

  def initialize(text:, url:, target: nil)
    @text   = text
    @url    = url
    @target = target
  end

  def template
    li(class: "list-none p-1 hover:font-semibold") do
      a(href: url, target: target) { text }
    end
  end

  private

  def items
    {
      "tete" => "/",
      **development_items,
    }
  end

  def development_items
    return {} unless Rails.env.development?

    {
      "Conductor" => rails_conductor_inbound_emails_path,
    }
  end
end
