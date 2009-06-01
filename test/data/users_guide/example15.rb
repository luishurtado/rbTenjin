require 'tenjin'
filename = 'example14.rbhtml'
template = Tenjin::Template.new(filename, :escapefunc=>'CGI.escapeHTML')
print template.script, "\n"

require 'cgi'
title = 'rbTenjin Example'
items = ['<foo>', '&bar', '"baz"']
output = template.render(:title=>title, :items=>items)
print output
