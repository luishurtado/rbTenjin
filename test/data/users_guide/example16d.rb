require 'tenjin'

class MyClass
  include Tenjin::ContextHelper
  #include Tenjin::HtmlHelper  # optional

  def link_to(label, url)    # define helper functions in current class
    return "<a href=\"#{escape(url)}\">#{escape(label)}</a>"
  end

  def render_template(template_name)
    engine = Tenjin::Engine.new()
    output = engine.render(template_name, self)  # pass self as context object
    return output
  end

  def main
    ## set context data as instance variables
    @label = 'Top'
    @url = '/'
    output = render_template('example16.rbhtml')
    print output
  end

end

MyClass.new.main()
