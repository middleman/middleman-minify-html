module Middleman
  module MinifyHtml
    class << self
      def registered(app)
        app.set :html_compressor, false
        
        app.after_configuration do
          unless respond_to?(:html_compressor) && html_compressor
            require 'html_compressor'
            set :html_compressor, ::HtmlCompressor::HtmlCompressor.new
          end
          
          # Setup Rack to watch for inline JS
          use MinifyHtmlRack, :compressor => html_compressor
        end
      end
      alias :included :registered
    end

    class MinifyHtmlRack
      
      # Init
      # @param [Class] app
      # @param [Hash] options
      def initialize(app, options={})
        @app = app
        @compressor = options[:compressor]
      end

      # Rack interface
      # @param [Rack::Environmemt] env
      # @return [Array]
      def call(env)
        status, headers, response = @app.call(env)

        path = env["PATH_INFO"]

        if path.end_with?('.html')
          uncompressed_source = extract_response_text(response)
          minified_html = @compressor.compress(uncompressed_source)

          headers["Content-Length"] = ::Rack::Utils.bytesize(minified_html).to_s
          response = [minified_html]
        end

        [status, headers, response]
      end

      private

      def extract_response_text(response)
        case(response)
        when String
          response
        when Array
          response.join
        when Rack::Response
          response.body.join
        when Rack::File
          File.read(response.path)
        else
          response.to_s
        end
      end
    end
    
  end
end
