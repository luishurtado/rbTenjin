require 'tenjin'

class MyContext < Tenjin::Context
  def link_to(label, url)
    return "<a href=\"#{escape_xml(url)}\">#{escape_xml(label)}</a>"
  end
end

engine = Tenjin::Engine.new()
context = MyContext.new(:label=>'Top', :url=>'/')
output = engine.render('example16.rbhtml', context)
print output
