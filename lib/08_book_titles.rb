class Book
  attr_reader :title

  def title=(value)
  	conjunction = ["a", "an", "the", "and", "or", "in", "of"]
  	@title = value.split(" ").map.with_index { |word, index|
  		index == 0 || !conjunction.include?(word) ? word.capitalize : word
  	}.join(" ")
  end
end
