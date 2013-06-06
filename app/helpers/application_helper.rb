require 'redcarpet/compat'
module ApplicationHelper
	def markdown(text)
    	options = {   
        	:fenced_code_blocks => true,
			:tables => true,
			:no_intra_emphasis =>true,
			:lax_spacing => true,
			:space_after_headers =>true,
			:superscript=>true
      	}
    	markdown = Redcarpet::Markdown.new(HTMLwithCodeRay,options)
    	markdown.render(h(text)).html_safe
	end

  	class HTMLwithCodeRay < Redcarpet::Render::HTML
    	def block_code(code, language)
      		CodeRay.scan(code, language).div(:tab_width=>2)
    	end
  	end
end
