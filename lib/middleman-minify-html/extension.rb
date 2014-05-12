module Middleman
  class MinifyHtmlExtension < Extension
    option :htmlcompressor_options, nil, 'Options hash to pass to Htmlcompressor'
    
    def initialize(app, options_hash={}, &block)
      super
      require 'htmlcompressor'
    end

    def after_configuration
      app.use ::HtmlCompressor::Rack, options.htmlcompressor_options.to_h
    end
  end
end
