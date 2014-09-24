class Dictionary
  attr_reader :entries

  def initialize
  	@entries = {}
  end

  def add(item)
  	item.is_a?(String) ? @entries[item] = nil : @entries.merge!(item)
  end

  def keywords
  	@entries.keys.sort
  end

  def include?(item)
  	keywords.include?(item)
  end

  def find(item)
  	result = {}
  	keywords.map { |key|  result[key] = @entries[key] if key.start_with?(item) }
  	result
  end

  def printable
  	@entries.sort_by { |key, value| key}.map { |key, value| 
  		value != nil ?  "[#{key}] \"#{value}\"" : "[#{key}]"
  	}.join("\n")
  end
end