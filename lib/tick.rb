require 'time'

class Tick
	def initialize(time, price)  
		# Instance variables  
		@price = price
		@time = time
	end  

	# Getters
	def time
		@time
	end

	def price
		@price
	end  
end
