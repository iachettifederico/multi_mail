# frozen_string_literal: true

class ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout

  def template(&)
    doctype

    html do
      head do
        title { "MultiMail" }
        meta(name: "viewport", content: "width=device-width,initial-scale=1")
        csp_meta_tag
        csrf_meta_tags
        stylesheet_link_tag("application", data_turbo_track: "reload")

        javascript_importmap_tags

        stylesheet_link_tag("tailwind", "inter-font", "data-turbo-track": "reload")
        stylesheet_link_tag "application"
      end

      body do
        render NavBarComponent.new

        main(&)
      end
    end
  end
end
