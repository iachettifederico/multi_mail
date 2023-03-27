module Views
  module Layouts
    class Page < Views::View

      def around_template(&)
        html {
          head {
            title { "NB Casts" }
            meta(name: "viewport", content: "width=device-width,initial-scale=1")

            script(src: "https://unpkg.com/htmx.org@1.8.5")
            script(src: "https://cdn.tailwindcss.com")
          }

          body(&)
        }
      end

    end
  end
end
