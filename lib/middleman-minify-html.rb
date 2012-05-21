require "middleman-core"

::Middleman::Extensions.register(:minify_html, ">= 3.0.0.beta.3") do
  require "middleman-minify-html/extension"
  ::Middleman::MinifyHtml
end