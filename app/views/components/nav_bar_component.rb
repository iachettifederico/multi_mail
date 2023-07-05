# frozen_string_literal: true

class NavBarComponent < ApplicationComponent
  def template
    nav(class: "fixed top-0 left-0 w-full bg-blue-900 text-blue-50 text-xs") do
      ul(class: "flex items-baseline gap-2") do
        span(class: "p-1 text-lg") { a(href: "/") { "MultiMail" } }

        items.each do |item|
          render item
        end
      end
    end
  end

  private

  def items
    [
      *development_items,
    ]
  end

  def development_items
    return [] unless Rails.env.development?

    [
      NavBarItemComponent.new(text: "Conductor", url: rails_conductor_inbound_emails_path, target: "_blank")
    ]
  end

end
