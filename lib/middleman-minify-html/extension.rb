require 'htmlcompressor'

module Middleman
  class MinifyHtmlExtension < ::Middleman::Extension
    option :ignore, [], 'Patterns to avoid minifying'
    option :content_types, %w[text/html], 'Content types of resources that contain HTML'
    # compressor options
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
    option :remove_http_protocol, false, 'Remove HTTP protocol'
    option :remove_https_protocol, false, 'Remove HTTPS protocol'
    option :preserve_line_breaks, false, 'Preserve line breaks'
    option :simple_boolean_attributes, true, 'Use simple boolean attributes'
    option :preserve_patterns, nil, 'Patterns to preserve'

    def initialize(app, _options_hash = ::Middleman::EMPTY_HASH, &block)
      super

      @ignore = Array(options[:ignore])
      compressor_options = options.to_h.reject do |k, _|
        [:ignore, :content_types].include?(k)
      end
      @compressor = HtmlCompressor::Compressor.new(compressor_options)
    end

    def manipulate_resource_list_container!(resource_list)
      resource_list.by_binary(false).each do |r|
        type = r.content_type.try(:slice, /^[^;]*/)
        if minifiable?(type) && !ignore?(r.destination_path)
          r.add_filter method(:minify)
        end
      end
    end

    def minifiable?(content_type)
      options[:content_types].include?(content_type)
    end
    memoize :minifiable?

    def ignore?(path)
      @ignore.any? { |ignore| ::Middleman::Util.path_match(ignore, path) }
    end
    memoize :ignore?

    def minify(content)
      @compressor.compress(content)
    end
    memoize :minify

  end
end
