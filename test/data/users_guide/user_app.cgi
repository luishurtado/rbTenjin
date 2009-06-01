#!/usr/bin/env ruby

require 'cgi'
require 'tenjin'

## set action ('create' or 'edit')
action = nil
cgi = nil
if ENV['REQUEST_METHOD']
  cgi = CGI.new
  action = cgi['action']
elsif ARGV[0]
  action = ARGV[0]
end
action = 'create' unless ['create', 'edit'].include?(action)

## set context data
if action == 'create'
  title = 'Create User'
  params = {}
else
  title = 'Edit User'
  params = {:name=>'Margalette',
            :email=>'meg@example.com',
	    :gender=>'f',
	    :id=>123 }
end
context = { :title=>title, :params=>params }
# or context = Tenjin::Context.new(:title=>title, :params=>params)

## create engine object
layout = :layout   # or 'user_layout.rbhtml'
engine = Tenjin::Engine.new(:prefix=>'user_', :postfix=>'.rbhtml', :layout=>layout)

## evaluate template
template_name = action.intern   # :create or :edit
output = engine.render(template_name, context)
print cgi.header() if cgi
print output
