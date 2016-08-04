class Tick  
	def initialize(utc_timestamp, price)  
		# Instance variables  
		@price = price
		@utc_timestamp = utc_timestamp
	end  

	# Getters
	def timestamp
		@utc_timestamp
	end  

	def price
		@price
	end  
end
