# frozen_string_literal: true

module Pages
  class HomeView < ApplicationView
    def template
      h1 { "Home Page" }

      h1 {InboundEmail.all.count}
      InboundEmail.all.each do |inbound_email|
        div(class: "m-3 p-2") {
          p { inbound_email.attributes.inspect }
        }
      end
    end
  end
end
