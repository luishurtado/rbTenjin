require 'tenjin'

class MyTemplate < Tenjin::Template

  ## return pattern object for embedded expressions
  def expr_pattern()
    return /([$#])\{(.*?)\}|<%=(.*?)%>/m
  end

  ## if you don't use '#{...}', you must escape '#' in addition to '\\' and '`'
  #def escape_str(str)
  #  return str.gsub(/[\\`\#]/, '\\\\\&')
  #end

  ## return expression string and flag whether escape or not from matched object
  def get_expr_and_escapeflag(match)
    if match[1]
      expr = match[2]
      escapeflag = match[1] == '$'
    else
      expr = match[3].strip()
      escapeflag = false
    end
    return expr, escapeflag
  end

end

if __FILE__ == $0
  context = { :value => 'AAA&BBB' }
  engine = Tenjin::Engine.new(:templateclass=>MyTemplate)
  output = engine.render('ex7-expr-pattern.rbhtml', context)
  puts output
end
