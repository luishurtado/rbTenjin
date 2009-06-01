require 'tenjin'
engine = Tenjin::Engine.new(:escapefunc=>'CGI.escapeHTML')
template = engine.get_template('ex3.rbhtml')
print template.script
