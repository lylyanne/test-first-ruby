class XmlDocument

  def initialize(should_indent = false)
  	@indent_space = 0
  	@should_indent = should_indent
  end

  def method_missing(m, *args, &block)  
  	 return "<#{m}/>\n" if args.length == 0 && block.nil? && @should_indent
  	 return "<#{m}/>" if args.length == 0 && block.nil? && @should_indent == false
  	 
  	result =''
 
  	if args.length > 0
	  	args.each do |h|
	  		h.each do |k, v|
	  			@should_indent ? result << "<#{m} #{k}='#{v}'/>\n" : result << "<#{m} #{k}='#{v}'/>" 
	  		end
	  	end
  	end

  	if !block.nil?
  		if @should_indent
  			@indent_space += 2
  			result << "<#{m}>\n" + ("\s" * @indent_space) + block.call.to_s + "\n" +  ( "\s" * (@indent_space - 2)) + "</#{m}>\n" 
			@indent_space -= 2
		else
			result << "<#{m}>" + block.call.to_s + "</#{m}>" 
		end
	end
	
  	result.gsub(/\n{2}/, "\n")
  end 
end