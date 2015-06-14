# Middleman-Minify-HTML

`middleman-minify-html` is an extension for the [Middleman] static site generator that minifies whitespace around HTML via [Htmlcompressor](https://github.com/paolochiodi/htmlcompressor).

## Installation

If you're just getting started, install the `middleman` gem and generate a new project:

```
gem install middleman
middleman init MY_PROJECT
```

If you already have a Middleman project: Add `gem 'middleman-minify-html'` to your `Gemfile` and run `bundle install`

## Configuration

```ruby
activate :minify_html
```
The various options can be passed with a block or as a hash like so:
```ruby
activate :minify_html, remove_input_attributes: false
```
These are the default settings, as listed in the [Htmlcompressor documentation](https://github.com/paolochiodi/htmlcompressor#usage):
```ruby
activate :minify_html do |html|
  html.remove_multi_spaces        = true   # Remove multiple spaces
  html.remove_comments            = true   # Remove comments
  html.remove_intertag_spaces     = false  # Remove inter-tag spaces
  html.remove_quotes              = true   # Remove quotes
  html.simple_doctype             = false  # Use simple doctype
  html.remove_script_attributes   = true   # Remove script attributes
  html.remove_style_attributes    = true   # Remove style attributes
  html.remove_link_attributes     = true   # Remove link attributes
  html.remove_form_attributes     = false  # Remove form attributes
  html.remove_input_attributes    = true   # Remove input attributes
  html.remove_javascript_protocol = true   # Remove JS protocol
  html.remove_http_protocol       = false  # Remove HTTP protocol
  html.remove_https_protocol      = false  # Remove HTTPS protocol
  html.preserve_line_breaks       = false  # Preserve line breaks
  html.simple_boolean_attributes  = true   # Use simple boolean attributes
  html.preserve_patterns          = nil    # Patterns to preserve
end
```

## Build & Dependency Status

[![Gem Version](https://badge.fury.io/rb/middleman-minify-html.png)][gem]
[![Build Status](https://travis-ci.org/middleman/middleman-minify-html.png)][travis]
[![Dependency Status](https://gemnasium.com/middleman/middleman-minify-html.png?travis)][gemnasium]
[![Code Quality](https://codeclimate.com/github/middleman/middleman-minify-html.png)][codeclimate]

## Community

The official community forum is available at: http://forum.middlemanapp.com

## Bug Reports

Github Issues are used for managing bug reports and feature requests. If you run into issues, please search the issues and submit new problems: https://github.com/middleman/middleman-minify-html/issues

The best way to get quick responses to your issues and swift fixes to your bugs is to submit detailed bug reports, include test cases and respond to developer questions in a timely manner. Even better, if you know Ruby, you can submit [Pull Requests](https://help.github.com/articles/using-pull-requests) containing Cucumber Features which describe how your feature should work or exploit the bug you are submitting.

## How to Run Cucumber Tests

1. Checkout Repository: `git clone https://github.com/middleman/middleman-minify-html.git`
2. Install Bundler: `gem install bundler`
3. Run `bundle install` inside the project root to install the gem dependencies.
4. Run test cases: `bundle exec rake test`

## Donate

[Click here to lend your support to Middleman](https://spacebox.io/s/4dXbHBorC3)

## License

Copyright (c) 2012-2014 Thomas Reynolds. MIT Licensed, see [LICENSE] for details.

[middleman]: http://middlemanapp.com
[gem]: https://rubygems.org/gems/middleman-minify-html
[travis]: http://travis-ci.org/middleman/middleman-minify-html
[gemnasium]: https://gemnasium.com/middleman/middleman-minify-html
[codeclimate]: https://codeclimate.com/github/middleman/middleman-minify-html
[LICENSE]: https://github.com/middleman/middleman-minify-html/blob/master/LICENSE.md
