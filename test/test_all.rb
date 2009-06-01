###
### $Rev: 45 $
### $Release: 0.6.2 $
### copyright(c) 2007-2008 kuwata-lab.com all rights reserved.
###

basedir = File.dirname(File.dirname(File.expand_path(__FILE__)))
testdir = basedir + '/test'
$: << testdir

require 'test/unit'
#require 'testutil'
require 'testcase-helper'
require 'assert-text-equal'
require 'tenjin'

Dir.chdir testdir
load 'test_template.rb'
load 'test_engine.rb'
load 'test_main.rb'
load 'test_htmlhelper.rb'
load 'test_users_guide.rb'
load 'test_faq.rb'
