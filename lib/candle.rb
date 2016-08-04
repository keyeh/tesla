class Candle

	def initialize(ticks)
		@ticks = ticks
		
		sortTicksByTimestamp()
		@open = @ticks.first
		@close = @ticks.last

		high_low = getHighLow()
		@high = high_low[:high]
		@low = high_low[:low]


	end  

	# Getters
	def open
		@open
	end

	def high
		@high
	end

	def low
		@low
	end

	def close
		@close
	end

	def update(tick)
		# Todo
	end

	private
	def getHighLow
		price_sort = @ticks.sort { |a,b| a.price <=> b.price }
		return {high: price_sort.last, low: price_sort.first}
	end

	def sortTicksByTimestamp
		@ticks.sort! { |a,b| a.timestamp <=> b.timestamp }
	end

end