module Jekyll
  module Converters
    class Markdown < Converter
      safe true
      priority :high

      def matches(ext)
        ext =~ /^\.(md|markdown)$/i
      end

      def output_ext(ext)
        ".html"
      end

      def convert(content)
        Kramdown::Document.new(content, {
          input: 'GFM',
          hard_wrap: false,
          auto_ids: true,
          parse_block_html: true,
          parse_span_html: true
        }).to_html
      end
    end
  end
end 