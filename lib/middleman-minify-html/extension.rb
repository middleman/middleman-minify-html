module Middleman
  module MinifyHtml
    class << self
      def registered(app, options={})
        app.set :html_compressor, false

        app.after_configuration do
          unless respond_to?(:html_compressor) && html_compressor
            set :html_compressor, HtmlCompressor::Compressor.new(options)
          end

          # Setup Rack to watch for inline JS
          use ::HtmlCompressor::Rack, options
        end
      end
      alias :included :registered
    end
  end
end
