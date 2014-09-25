class Fixnum
	SINGLES = { :zero => 0, :one => 1, :two => 2, :three => 3, :four => 4, :five => 5, :six => 6, :seven => 7, :eight => 8, :nine => 9 }
	TEENS = { :ten => 10, :eleven => 11, :twelve => 12, :thirteen => 13, :fourteen => 14, :fifteen => 15, :sixteen => 16, :seventeen => 17, 
				:eighteen => 18, :nineteen => 19 }
	TENS = { :twenty => 20, :thirty => 30, :forty => 40, :fifty => 50, :sixty => 60, :seventy => 70, :eighty => 80, :ninety => 90 }
	
	def in_words
		result = ""
		num_str = self.to_s
		trillion = num_str.match(/(\d)\d{12}$/)
		result << "#{SINGLES.key(trillion[1].to_i).to_s} trillion " unless trillion == nil || trillion[1] == "0" 
		hundred_billion = num_str.match(/(\d)\d{11}$/) 
		result << "#{SINGLES.key(hundred_billion[1].to_i).to_s} hundred " unless hundred_billion == nil || hundred_billion[1] == "0"
		ten_billion = num_str.match(/(\d)(\d)\d{9}$/)
		if ten_billion != nil
			result << two_digit(ten_billion[1], ten_billion[2]) + "billion " unless ten_billion[1..2].join == "00"
		else
			billion = num_str.match(/(\d)\d{9}$/) 
			result << "#{SINGLES.key(billion[1].to_i).to_s} billion " unless billion == nil || billion[1] == "0" 
		end
		hundred_million = num_str.match(/(\d)\d{8}$/) 
		result << "#{SINGLES.key(hundred_million[1].to_i).to_s} hundred " unless hundred_million == nil || hundred_million[1] == "0"
		ten_million = num_str.match(/(\d)(\d)\d{6}$/)
		if ten_million != nil   #check to make sure this is a number > 9_999_999 and not a number like 100_555_111
			result << two_digit(ten_million[1], ten_million[2]) + "million " unless ten_million[1..2].join == "00"
		else
			million = num_str.match(/(\d)\d{6}$/) 
			result << "#{SINGLES.key(million[1].to_i).to_s} million " unless million == nil || million[1] == "0" 
		end
		hundred_thousand = num_str.match(/(\d)\d{5}$/) 
		result << "#{SINGLES.key(hundred_thousand[1].to_i).to_s} hundred " unless hundred_thousand == nil || hundred_thousand[1] == "0" 
		ten_thousand = num_str.match(/(\d)(\d)\d{3}$/)
		if ten_thousand != nil  #check to make sure this is a number > 9999 and not a number like 500111 
			result << two_digit(ten_thousand[1], ten_thousand[2]) + "thousand " unless ten_thousand[1..2].join == "00" 
		else
			thousand = num_str.match(/(\d)\d{3}$/) 
			result << "#{SINGLES.key(thousand[1].to_i).to_s} thousand " unless thousand == nil || thousand[1] == "0" 
		end
		hundred = num_str.match(/(\d)\d{2}$/) 
		result << "#{SINGLES.key(hundred[1].to_i).to_s} hundred " unless hundred == nil || hundred[1] == "0" 
		tens = num_str.match(/(\d)(\d)$/)
		if tens == nil 
			result << "#{SINGLES.key(self).to_s} " #single number
		elsif tens[0] != "00"  #check to make sure this is not a 00
			result << two_digit(tens[1], tens[2]) #2 digit numbers
		end
		result.gsub(/\s$/, "")
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
