class Temperature
  def initialize(temp_hash={})
  	@temp_hash = temp_hash
  end

  def in_fahrenheit
  	@temp_hash[:f] != nil ? @temp_hash[:f] : ctof(@temp_hash[:c])
  end

  def in_celsius
  	@temp_hash[:c] != nil ? @temp_hash[:c] : ftoc(@temp_hash[:f])
  end

  def self.from_celsius(degree)
  	self.new(:c => degree)
  end

  def self.from_fahrenheit(degree)
  	self.new(:f => degree)
  end

  private
  def ftoc(f)
	(f-32) / 9.0 * 5.0
  end

  def ctof(c)
	c / 5.0 * 9.0 + 32
  end
end

class Celsius < Temperature
	def initialize(degree)
		super(:c => degree)
	end
end

class Fahrenheit < Temperature
	def initialize(degree)
		super(:f => degree)
	end
end
