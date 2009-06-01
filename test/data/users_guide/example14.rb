## template file
filename = 'example14.rbhtml'

## convert into ruby code
require 'tenjin'
template = Tenjin::Template.new(filename)
## or
# template = Tenjin::Template.new()
# script = template.convert_file(filename)
## or
# template = Tenjin::Template.new()
# input = File.read(filename)
# script = template.convert(input, filename)  # filename is optional

## show converted ruby code
puts "---- ruby code ----"
puts template.script

## evaluate ruby code
hash = {:title=>'rbTenjin Example', :items=>['<AAA>','B&B','"CCC"']}
output = template.render(hash)
puts "---- output ----"
puts output
## or
#hash = {:title=>'rbTenjin Example', :items=>['<AAA>','B&B','"CCC"']}
#context = Tenjin::Context.new(hash)
#output = template.render(context)
## or
# context = Tenjin::Context.new
# context[:title] = 'rbTenjin Example'
# context[:items] = ['<AAA>','B&B','"CCC"']
# output = template.render(context)
