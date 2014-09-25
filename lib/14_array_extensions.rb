class Array
	def sum
		self.dup.inject(0) { |sum, value| sum += value }
	end

	def square
		self.dup.map { |x| x*x }
	end

	def square!
		self.map! { |x| x*x }
	end
end