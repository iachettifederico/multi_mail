# frozen-string-literal: true

require "phlex"

class Roda
  module RodaPlugins
    module Phlex

      def self.configure(app, opts=OPTS)
        classes = opts[:classes] || [::Phlex::HTML]

        app.opts[:phlex_result_classes] ||= []
        app.opts[:phlex_result_classes] += classes
        app.opts[:phlex_result_classes].uniq!
        app.opts[:phlex_result_classes].freeze
      end

      module ClassMethods
        # The classes that should be automatically converted to phlex
        def phlex_result_classes
          opts[:phlex_result_classes]
        end
      end

      module RequestMethods
        private

        def block_result_body(result)
          case result
          when *roda_class.phlex_result_classes
            response['Content-Type'] ||= "text/html"
            convert_to_html(result)
          else
            super
          end
        end

        def convert_to_html(obj)
          obj.call
        end
      end
    end

    # puts "  >>>>> #{__FILE__}:#{__LINE__}".green
    # ap m self
    # puts "  >>>>> #{__FILE__}:#{__LINE__}".green
    register_plugin(:phlex, Phlex)

  end
end
