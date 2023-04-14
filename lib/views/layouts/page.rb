module Views
  module Layouts
    class Page < Views::View

      def around_template(&block)
        html {
          head {
            title { "MultiMail" }
            meta(name: "viewport", content: "width=device-width,initial-scale=1")

            script(src: "https://unpkg.com/htmx.org@1.8.5")
            script(src: "https://cdn.tailwindcss.com")
          }

          body {
            main {
              block.call
            }
          }
        }
      end

    end
  end
end
