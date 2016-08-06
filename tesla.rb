require 'indicator'
require 'time'
require 'active_support/time'
include Indicator
include Indicator::AutoGen


require './lib/tick'
require './lib/chart'

require 'ripl'

t1 = Tick.new(Time.now, 601)
t2 = Tick.new(Time.now + 5.minutes, 605)
t3 = Tick.new(Time.now + 10.minutes, 610)
t4 = Tick.new(Time.now + 15.minutes, 650)
t5 = Tick.new(Time.now + 20.minutes, 630)
t6 = Tick.new(Time.now + 25.minutes, 625)
t7 = Tick.new(Time.now + 30.minutes, 620)
t8 = Tick.new(Time.now + 35.minutes, 612)
t9 = Tick.new(Time.now + 40.minutes, 615)
t10 = Tick.new(Time.now + 45.minutes, 617)

c = Chart.new([t1, t2, t3, t4, t5, t6, t7, t8, t9, t10])

sma = Indicator.create_named :sma_5

Ripl.start :binding => binding