## Usage {% download '/assets/files/yoga_certification.pdf' 'Download Certification' %}

module Jekyll
    class RenderDownloadTag < Liquid::Tag
  
      require "shellwords"
      require "kramdown"
  
      def initialize(tag_name, text, tokens)
        super
        @text = text.shellsplit
      end
  
      def render(context)
        # Gather settings
        site = context.registers[:site]
        baseurl = site.config['baseurl']
        
        # Process the caption
        caption = Kramdown::Document.new(@text[1], {remove_span_html_tags: true}).to_html
        caption = caption.gsub(/<\/?p[^>]*>/, "").chomp  # Remove <p> tags from rendered caption
  
        # Check if the file URL starts with http(s) or is relative
        file_path = @text[0]
        if file_path.start_with?('http://', 'https://', '//')
          # If it's an external URL, directly use it
          "<a href='#{file_path}' download><span class='icon-cloud-download'></span> #{caption}</a>"
        else
          # Otherwise, use a relative URL with baseurl
          "<a href='#{baseurl}/#{file_path}' download><span class='icon-cloud-download'></span> #{caption}</a>"
        end
      end
    end
  end
  
  Liquid::Template.register_tag('download', Jekyll::RenderDownloadTag)