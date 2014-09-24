class RPNCalculator
  def initialize
  	@calc = []
  end

  def push(num)
  	@calc << num.to_f
  end

  def plus
  	operator(:+)
  end

  def minus
  	operator(:-)
  end

  def divide
  	operator(:/)
  end

  def times
  	operator(:*)
  end

  def value
  	@calc.last
  end

  def tokens(str)
  	tokens_arr = []
  	str.split(' ').each { |x| x.match(/\d/)!= nil ? tokens_arr << x.to_i : tokens_arr << x.to_sym }
  	tokens_arr
  end

  def evaluate(str)
  	str.split(" ").each { |x| 
  		if x == "+" 
  			plus
  		elsif x == "*" 
  		 	times
  		elsif x == "-" 
  		 	minus
  		elsif x == "/" 
  		 	divide
  		else
  			push(x)
  		end
  	}
  	value
  end

  def operator(sym)
  	raise ArgumentError.new('calculator is empty') if @calc.length < 2
	@calc <<  @calc.pop(2).inject(&sym)
  end
end