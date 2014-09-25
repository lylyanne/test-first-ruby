class Fixnum
	SINGLES = { :one => 1, :two => 2, :three => 3, :four => 4, :five => 5, :six => 6, :seven => 7, :eight => 8, :nine => 9 }
	TEENS = { :ten => 10, :eleven => 11, :twelve => 12, :thirteen => 13, :fourteen => 14, :fifteen => 15, :sixteen => 16, :seventeen => 17, 
				:eighteen => 18, :nineteen => 19 }
	TENS = { :twenty => 20, :thirty => 30, :forty => 40, :fifty => 50, :sixty => 60, :seventy => 70, :eighty => 80, :ninety => 90 }
	
	def in_words
		return "zero" if self == 0 # I don't have zero on the hash above because 
		# the code is designed to combine the TENS hash with the SINGLES hash.
		# 27 will be "twenty seven" but 20 should just be "twenty" and not "twenty zero"

		result = ""
		num_str = self.to_s
		result << three_digit_check(12, "trillion") 
		result << three_digit_check(9, "billion") 
		result << three_digit_check(6, "million") 
		result << three_digit_check(3, "thousand") 
		result << three_digit_check(0, "")
		result.gsub(/\s+$/, "")
	end
	
	def three_digit_check(digit, term)
		text = ""
		num_str = self.to_s
		special_case_needed = true

		# This is to convert the 3 digit into word like 325 into three hundred twenty five + its term
		hundred_something = num_str.match(/(\d)\d{#{digit+2}}$/) 
		text << "#{SINGLES.key(hundred_something[1].to_i).to_s} hundred " unless hundred_something == nil || hundred_something[1] == "0" 
		ten_something = num_str.match(/(\d)(\d)\d{#{digit}}$/)
		if ten_something != nil  
			text << two_digit(ten_something[1], ten_something[2]) + "#{term} " unless ten_something[1..2].join == "00" 
			ten_something[1..2].join == "00" ? special_case_needed = true : special_case_needed = false
		else
			single = num_str.match(/(\d)\d{#{digit}}$/)
			text << "#{SINGLES.key(single[1].to_i).to_s} #{term} " unless single == nil || single[1] == "0" 
			special_case_needed = false
		end

		# Special case for a number like 900_300_000 so that the word million and thousand is added properly
		# The set of code above correctly translates 325 into three hundred twenty five + its term
		# But when it is just 300, the term is not added so the translation will be incorrect
		# The code below will add the term
		if special_case_needed == true
			preceeding_zeroes = num_str.match(/(\d\d\d)\d{#{digit}}$/)
			text << "#{term} " if preceeding_zeroes != nil && preceeding_zeroes[1] != "000"
		end
		text
	end

	def two_digit(str1, str2)
		num = (str1 + str2).to_i 
		if num <= 9
			"#{SINGLES.key(num).to_s} "
		elsif num < 20
			"#{TEENS.key(num).to_s} " 
		else
			str2 == "0" ? "#{TENS.key(num).to_s} " : "#{TENS.key((str1+"0").to_i).to_s} #{SINGLES.key(str2.to_i).to_s} "
		end
	end
end
