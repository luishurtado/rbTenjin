require 'erubis'
require 'tenjin'

include Erubis::XmlHelper

context = { :items => ['<AAA>', 'B&B', '"CCC"'] }
engine = Tenjin::Engine.new(:layout=>'ex6-layout.rhtml',
                           :templateclass=>Tenjin::ErubisTemplate)
output = engine.render('ex6-content.rhtml', context)
print output
