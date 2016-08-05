require 'indicator'
require 'time'
include Indicator
include Indicator::AutoGen


require './lib/tick'
require './lib/chart'

require 'ripl'

t1 = Tick.new("1470521737", 601)
t2 = Tick.new("1470522737", 605)
t3 = Tick.new("1470523737", 610)
t4 = Tick.new("1470524737", 650)
t5 = Tick.new("1470525737", 630)
t6 = Tick.new("1470526737", 625)
t7 = Tick.new("1470527737", 620)
t8 = Tick.new("1470528737", 612)
t9 = Tick.new("1470529737", 615)
t10 = Tick.new("1470530737", 617)

c = Chart.new([t1, t2, t3, t4, t5, t6, t7, t8, t9, t10])

sma = Indicator.create_named :sma_5

Ripl.start :binding => binding