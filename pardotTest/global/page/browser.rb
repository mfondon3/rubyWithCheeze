class Browser

  def initialize(browser)
    @browser = browser
  end

  def html
    browser.html
  end

  def url
    browser.url
  end

  attr_reader :browser
  def load(yml_file)
    @@page_hash = YAML::load( File.open(yml_file))
    @@page_hash.each do |key, value|
      initialize_page(key['name'])
    end
  end

  def page_url_lookup(page_name)
     p = @@page_hash.detect { |i| i['name']==page_name}

    link = nil
    if(!p.nil?)
      link = p['url'].sub("DOMAIN",ENV['DOMAIN'])
    end
  end

   def accept_popup
     browser.driver.switch_to.alert.accept
   end


  def navigate(arg1)

    p = @@page_hash.detect { |i| i['name']==arg1}

    link = nil
    if(!p.nil?)
      link = p['url'].sub("DOMAIN",ENV['DOMAIN'])
    end

    if(!link.nil?)
      goto(link)
    elsif(arg1.include?("http://"))
      goto(arg1)
    else
      goto('http://' + ENV['DOMAIN'] + '/' + arg1)
    end
  end


  def goto(link)
    browser.goto(link)
  end

  def initialize_page(page_name)
      class_name = page_name.split(' ').map {|word| word.capitalize}.join('') + 'Page'
      if (Object.const_defined?(class_name))
        page_object = Object.const_get(class_name).new
        variable_name = page_name.gsub(" ", "_").downcase + '_page'
        eval("$#{variable_name} = page_object")
        puts("CREATED PAGE INSTANCE #{class_name}")
        page_object
      end
  end

  def wait_for_element(search_hash, timeout = 30)
    element = PageHelper.find(search_hash)
    element.wait_until_present(timeout)
    element
  end



  def text_field(attributes)
    browser.text_field(attributes)
  end

  def button(attributes)
    browser.button(attributes)
  end

  def div(attributes)
    browser.div(attributes)
  end

  def divs(attributes)
    $browser.divs(attributes)
  end

  def link(attributes)
    browser.link(attributes)
  end

  def li(attributes)
    browser.li(attributes)
  end

  def radio(attributes)
     browser.radio(attributes)
  end

  def checkbox(attributes)
     browser.checkbox(attributes)
  end

  def combobox(attributes)
      browser.select_list(attributes)
  end

end