require 'active_support/time'

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
		candles = []

		candleCloseIndex = 0

		while candleCloseIndex < @ticks.length-1
			workingTicksSet = @ticks.drop(candleCloseIndex)

			candleOpen = workingTicksSet.first
			candleHigh = workingTicksSet.first
			candleLow = workingTicksSet.first
			candleClose = nil

			workingTicksSet.each_with_index { |tick, index|
				candleHigh = tick if tick.price >= candleHigh.price
				candleLow = tick if tick.price <= candleLow.price

				puts "candleCloseIndex= #{candleCloseIndex}"

				if  workingTicksSet[index+1].present? == false || workingTicksSet[index+1].time > candleOpen.time + interval
					candleClose = tick
					candleCloseIndex = candleCloseIndex+index
					break
				end
			}

			candles.push [candleOpen, candleHigh, candleLow, candleClose]
		end

		return candles
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