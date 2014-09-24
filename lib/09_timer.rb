class Timer
	attr_accessor :seconds

	def initialize
		@seconds = 0
	end

	def time_string
		hours = @seconds / 3600
		mins = @seconds % 3600 / 60
		secs = @seconds % 3600 % 60
		hours = padded(hours)
		mins = padded(mins)
		secs = padded(secs)
		"#{hours}:#{mins}:#{secs}"
	end

	def padded(num)
		num > 9 ? num.to_s : "0#{num}"
	end
end