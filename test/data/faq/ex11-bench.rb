## create Engine object for each layout file
require 'tenjin'
engine1 = Tenjin::Engine.new(:layout=>'ex11-layout1.rbhtml')
engine2 = Tenjin::Engine.new(:layout=>'ex11-layout2.rbhtml')

## warm up
filename = 'ex11-content.rbhtml'
output1 = engine1.render(filename)
output2 = engine2.render(filename)
raise "*** output1 != output2" if output1 != output2

## do benchmark
require 'benchmark'
N = 10000
Benchmark.bm(20) do |job|
  GC.start()
  job.report('layout1') do
    N.times do
      output1 = engine1.render(filename)
    end
  end
  GC.start()
  job.report('layout2') do
    N.times do
      output2 = engine2.render(filename)
    end
  end
end
