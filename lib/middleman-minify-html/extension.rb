module Middleman
  class MinifyHtmlExtension < Extension
    def initialize(*)
      super
      require 'htmlcompressor'
    end

    def after_configuration
      app.use ::HtmlCompressor::Rack, options.to_h
    end
  end
end
