module Middleman
  class MinifyHtmlExtension < Extension
    option :remove_multi_spaces, true, 'Remove multiple spaces'
    option :remove_comments, true, 'Remove comments'
    option :remove_intertag_spaces, false, 'Remove inter-tag spaces'
    option :remove_quotes, true, 'Remove quotes'
    option :simple_doctype, false, 'Use simple doctype'
    option :remove_script_attributes, true, 'Remove script attributes'
    option :remove_style_attributes, true, 'Remove style attributes'
    option :remove_link_attributes, true, 'Remove link attributes'
    option :remove_form_attributes, false, 'Remove form attributes'
    option :remove_input_attributes, true, 'Remove input attributes'
    option :remove_javascript_protocol, true, 'Remove JS protocol'
    option :remove_http_protocol, true, 'Remove HTTP protocol'
    option :remove_https_protocol, false, 'Remove HTTPS protocol'
    option :preserve_line_breaks, false, 'Preserve line breaks'
    option :simple_boolean_attributes, true, 'Use simple boolean attributes'

    def initialize(*)
      super
      require 'htmlcompressor'
    end

    def after_configuration
      app.use ::HtmlCompressor::Rack, options.to_h
    end
  end
end
