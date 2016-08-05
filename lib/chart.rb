require 'indicator'
require 'time'
include Indicator
include Indicator::AutoGen

class Chart

	# Array of ticks
	def initialize(ticks=[])
		@ticks = ticks
		@indicators = {}
		sortTicksByTime()
	end


	# ====Getters====
	def indicator(name)
		@indicators[name]
	end

	def getTickPrices
		@ticks.map { |t| t.price }
	end

	def getCandles(interval)
		@candles = []
		@ticks.each do |tick|

		end
	end


	# ====Adding Ticks====
	
	# Add and sort ticks
	def addTicks(ticks)
		appendTicks(ticks)
		sortTicksByTime()
	end

	# Add and don't sort ticks
	def appendTicks(ticks)
		@ticks.concat(ticks)
	end



	# TA
	def addIndicator(name, indicator)
		@indicators.merge!({name => indicator})
	end



	private
	def sortTicksByTime
		@ticks.sort! { |a,b| a.time <=> b.time }
	end

end