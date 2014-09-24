def echo(str)
	str
end

def shout(str)
	str.upcase
end	

def repeat(str, times=2)
	repeat_str = [str] * times
	repeat_str.join(' ')
end

def start_of_word(str, range)
	str[0..range-1]
end

def first_word(str)
	str.split(" ").first
end

def titleize(str)
	little_words = ["and", "over", "the", "or", "at", "in"]
	str.split(' ').map.with_index { |word, index| 
		index == 0 || !little_words.include?(word) ? word.capitalize : word
	}.join(' ')
end