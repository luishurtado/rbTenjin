###
### $Rev: 52 $
### $Release: 0.6.2 $
### copyright(c) 2007-2008 kuwata-lab.com all rights reserved.
###

require 'test/unit'
#require 'testutil'
require 'testcase-helper'
require 'assert-text-equal'
require 'tenjin'


class TenjinHtmlHelperTest < Test::Unit::TestCase

  def test_tagattr
    actual = Tenjin::HtmlHelper.tagattr('size', 20)
    expected = ' size="20"'
    assert_equal(expected, actual)
    #
    actual = Tenjin::HtmlHelper.tagattr('size', nil)
    expected = ''
    assert_equal(expected, actual)
    #
    actual = Tenjin::HtmlHelper.tagattr('checked', true, 'checked')
    expected = ' checked="checked"'
    assert_equal(expected, actual)
    #
    actual = Tenjin::HtmlHelper.tagattr('checked', false, 'checked')
    expected = ''
    assert_equal(expected, actual)
  end

  def test_checked
    actual = Tenjin::HtmlHelper.checked(1==1)
    expected = ' checked="checked"'
    assert_equal(expected, actual)
    #
    actual = Tenjin::HtmlHelper.checked(1==0)
    expected = ''
    assert_equal(expected, actual)
  end

  def test_selected
    actual = Tenjin::HtmlHelper.selected(1==1)
    expected = ' selected="selected"'
    assert_equal(expected, actual)
    #
    actual = Tenjin::HtmlHelper.selected(1==0)
    expected = ''
    assert_equal(expected, actual)
  end

  def test_disabled
    actual = Tenjin::HtmlHelper.disabled(1==1)
    expected = ' disabled="disabled"'
    assert_equal(expected, actual)
    #
    actual = Tenjin::HtmlHelper.disabled(1==0)
    expected = ''
    assert_equal(expected, actual)
  end

  def test_nl2br
    s = """foo\nbar\nbaz\n"""
    actual = Tenjin::HtmlHelper.nl2br(s)
    expected = "foo<br />\nbar<br />\nbaz<br />\n"
    assert_equal(expected, actual)
  end

  def test_text2html
    s = """foo\n    bar\nba     z\n"""
    actual = Tenjin::HtmlHelper.text2html(s)
    expected = "foo<br />\n &nbsp; &nbsp;bar<br />\nba &nbsp; &nbsp; z<br />\n"
    assert_equal(expected, actual)
  end

end
