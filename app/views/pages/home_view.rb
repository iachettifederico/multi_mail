# frozen_string_literal: true

module Pages
  class HomeView < ApplicationView
    def template
      h1 { "Home Page" }

      p { "Find me in app/views/pages/home_view.rb" }

      ul do
        li { "uno" }
        li { "dos" }
        li { "tres" }
      end

      blockquote { "this is a quote" }
    end
  end
end
