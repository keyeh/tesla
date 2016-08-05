require 'time'

class Tick
	def initialize(utc_timestamp, price)  
		# Instance variables  
		@price = price
		@time = DateTime.strptime(utc_timestamp,'%s')
	end  

	# Getters
	def time
		@time
	end

	def price
		@price
	end  
end
