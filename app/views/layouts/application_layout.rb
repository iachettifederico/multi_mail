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

        javascript_importmap_tags

        stylesheet_link_tag("application", data_turbo_track: "reload")
        stylesheet_link_tag("tailwind", "inter-font", "data-turbo-track": "reload")
      end

      body do
        render NavBarComponent.new

        main(&)
      end
    end
  end
end
