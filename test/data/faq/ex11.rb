require 'tenjin'
engine = Tenjin::Engine.new(:templateclass=>Tenjin::ArrayBufferTemplate)
context = { :items=>['AAA', 'BBB', 'CCC'] }
output = engine.render('ex11.rbhtml', context)
puts output
