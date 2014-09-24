def add(num1, num2)
	num1 + num2
end

def subtract(num1, num2)
	num1 - num2
end

def sum(arr)
	arr.inject(0) { |sum, value| sum += value }
end

def multiply(num1, num2)
	num1 * num2
end

def power(num1, num2)
	num1 ** num2
end

def factorial(num)
	return 1 if num == 0
	num * factorial(num-1)
end