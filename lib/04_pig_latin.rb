def translate(str)
	word_arr = str.split(' ')
	word_arr.map { |word|
		translate_word(word)
	}.join(' ')
end

def translate_word(word)
	vowel = %w(a e i o u)
	letter_arr = word.split('')
	first_vowel_found = false
	while !first_vowel_found #keep looping until the first vowel is found
		 if letter_arr[0] == "q" && letter_arr[1] == "u"
		 	letter_arr.rotate!(2)
		 elsif !vowel.include?(letter_arr[0])
			letter_arr.rotate!(1)
		 else
		 	first_vowel_found = true
		 end
	end
	letter_arr.join + "ay"
end