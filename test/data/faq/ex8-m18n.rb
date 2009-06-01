require 'tenjin'

##
## message catalog to translate message
##
MESSAGE_CATALOG = {
  'en' => { 'Hello'   => 'Hello',
            'Good bye'=> 'Good bye', },
  'fr' => { 'Hello'   => 'Bonjour',
            'Good bye'=> 'Au revoir', },
}


##
## add translation method to Context class
##
class Tenjin::Context

  def _(message_key)
    message_dict = MESSAGE_CATALOG[@_lang]
    return message_key unless message_dict
    return message_dict[message_key] || message_key
  end

end


##
## engine class which supports M17N
##
class M17NEngine < Tenjin::Engine

  attr_accessor :lang

  ## constructor takes ':lang' options
  def initialize(properties={})
    super(properties)
    @lang = properties[:lang] || 'en'   # set language
  end

  ## change cache filename to 'file.html.lang.cache'
  def cachename(filename)
    return "#{filename}.#{@lang}.cache"
  end

  ## set language to context object
  def hook_context(context)
    context = super(context)
    context['_lang'] = @lang
    return context
  end

end


##
## test program
##
if $0 == __FILE__

  template_name = 'ex8-m18n.rbhtml'
  context = { :username => 'World' }
  
  ## engine for english
  engine = M17NEngine.new(:preprocess=>true)
  output = engine.render(template_name, context)   # same template
  puts "--- lang: %s ---" %  engine.lang
  puts output
  puts
  
  ## engine for French
  engine = M17NEngine.new(:preprocess=>true, :lang=>'fr')
  output = engine.render(template_name, context)   # same template
  puts "--- lang: %s ---" %  engine.lang
  puts output

end
