require "middleman-core"

::Middleman::Extensions.register(:minify_html) do
  require "middleman-minify-html/extension"
  ::Middleman::MinifyHtmlExtension
end