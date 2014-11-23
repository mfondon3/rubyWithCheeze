class PageHelper

  def self.url
    $browser.url
  end
  
  #def self.load(yml_file)
    #@@page_hash = YAML::load( File.open(yml_file))
    #@@page_hash.each do |key, value|
      #initialize_page(key['name'])
    #end
  #end




  def self.navigate_relative(url)
    $browser.goto('http://' + ENV['DOMAIN'] + url)
  end

  #def self.navigate(page_name)

    #p = @@page_hash.detect { |i| i['name']==page_name }

    #link = nil
    #if(!p.nil?)
      #link = p['url'].sub("DOMAIN",ENV['DOMAIN'])
    #end

    #if(!link.nil?)
      #initialize_page(page_name)
      #$browser.goto(link)
      #return
    #end

    #raise "Could not map \"#{page_name}\" to an url."

  #end

  UrlWaitTimes = 60
  UrlWaitSeconds = 1

  def self.wait_for_url_matching(regex)
    UrlWaitTimes.times do
      if regex.match($browser.url)
        return true
      end
      sleep(UrlWaitSeconds)
    end
    
    return false
  end

  #def self.initialize_page(page_name)
      #create page instance if exists
      #class_name = page_name.split(' ').map {|word| word.capitalize}.join('') + 'Page'
      #if (Object.const_defined?(class_name))
        #page_object = Object.const_get(class_name).new
        #variable_name = page_name.gsub(" ", "_").downcase + '_page'
        #eval("$#{variable_name} = page_object")
        #puts("*****created page object instance #{class_name}*****")
        #return page_object
      #end
  #end

  def self.text
    $browser.text
  end

  def self.url
    $browser.url
  end

  def self.title
    $browser.title
  end

  def self.html
    $browser.html
  end

  def self.find_button(attribute, value)
    $browser.button(attribute => value)
  end

  def self.find_checkbox(attribute, value)
    $browser.checkbox(attribute => value)
  end

  def self.find_combobox(attribute, value)
    $browser.select_list(attribute => value)
  end

  def self.select_combobox_by_value(combobox, value)
    combobox.select_value(value)
  end

  def self.select_combobox_by_text(combobox, text)
    combobox.select(text)
  end

  def self.find_link(attribute, value)
    $browser.link(attribute => value)
  end

  def self.click_link(attribute, value)
    $browser.link(attribute => value).click
  end

  def self.click_located_link(link)
    link.click
  end

  def self.click_button(attribute, value)
    $browser.button(attribute => value).click
  end

  def self.click_located_button(button)
    button.click
  end

  def self.click_element(attribute, value)
    $browser.element(attribute => value).click
  end

  def self.find_element(attribute, value)
    $browser.element(attribute => value)    
  end

  def self.find_form(attribute, value)
    $browser.form(attribute => value)
  end

  def self.find_div(attribute, value)
    $browser.div(attribute => value)
  end


  def self.write_to_text_field(attribute, value, text)
    $browser.text_field(attribute => value).set text
  end

  def self.write_to_located_text_field(field, text)
    field.set text
  end
  def self.find_radio_button(attribute, value)
    $browser.radio(attribute => value)
  end

  def self.find_radio_buttons(attribute, value)
    $browser.radios(attribute => value)
  end

  def self.click_radio(attribute, value)
    $browser.radio(attribute => value).set
  end

  def self.click_located_radio(radio)
    radio.set
  end

  def self.find_select_list(attribute, value)
    $browser.select_list(attribute, value)
  end

  def self.set_select_list(attribute, value, text)
    $browser.select_list(attribute, value).select(text)
  end

  def self.find_file_field(attribute, value)
    $browser.file_field(attribute => value)
  end

  def self.find_text_field(attribute, value)
    $browser.text_field(attribute => value)
  end

  def self.find_checkbox(attribute, value)
    $browser.checkbox(attribute, value)
  end

  def self.set_checkbox(attribute, value)
    $browser.checkbox(attribute, value).set
  end

  def self.set_located_checkbox(checkbox)
    checkbox.set
  end

  def self.clear_located_checkbox(checkbox)
    checkbox.clear
  end

  def self.clear_checkbox(attribute, value)
    $browser.checkbox(attribute, value).clear
  end

  def self.submit(attribute, value)
    $browser.form(attribute => value).submit
  end

  def self.wait_for_element(attribute, value, timeout = 30)
    $browser.element(attribute, value).wait_until_present(timeout)
  end

  def self.accept_javascript_popup
    $browser.driver.switch_to.alert.accept
  end



  def self.wait_for_li(attribute, value, timeout = 30)
    $browser.li(attribute, value).wait_until_present(timeout)
  end

  def self.wait_while_present(attribute, value)
    $browser.element(attribute, value).wait_while_present
  end

  def self.reset_window()
    all = $browser.driver.window_handles
    $browser.driver.switch_to.window(all[0])
  end

  def self.switch_window()
    current = $browser.driver.window_handle
    all = $browser.driver.window_handles
    if(all.count > 1)
      if (all[0] == current)
        $browser.driver.switch_to.window(all[1]);
      else
        $browser.driver.switch_to.window(all[0]);
      end
    end
  end

  def self.fire_event(attribute, value, event)
      find_element(attribute,value).fire_event(event)
  end

  def self.switch_to_newest_window()
    current = $browser.driver.window_handle
    all = $browser.driver.window_handles
    if(all.count > 1)
      $browser.driver.switch_to.window(all[all.count - 1]);
    end
  end

  def self.navigate_back()
    $browser.back()
  end

  def self.send_keys(attribute, value, key)
    $browser.element(attribute => value).send_keys(key)
  end

  def self.wait
    $browser.wait
  end

  def self.send_located_keys(element, key)
    element.send_keys(key)
  end

  def self.find(hash)
    check_element_hash(hash)
    create(hash)
  end

  def self.check_element_hash(hash)
    if (!hash.has_key?(:type))
      raise "Element does not have a type. Please refine."
    end
  end

  def self.create(element_hash)
    type =  element_hash.fetch(:type)
    attributes = element_hash.clone
    attributes.delete(:type)
    case type
      when "button"
        Button.new($browser.button(attributes))
      when "checkbox"
        CheckBox.new($browser.checkbox(attributes))
      when "div"
        Div.new($browser.div(attributes))

      when "divs"
        Divs.new($browser.divs(attributes))

      when "form"

      when "image"

      when "li"
        Li.new($browser.li(attributes))
      when "link"
        Link.new($browser.link(attributes))
      when "radio"
        Radio.new($browser.radio(attributes))
      when "table"

      when "textfield"
        TextField.new($browser.text_field(attributes))
      when "combobox"
        ComboBox.new($browser.combobox(attributes))
      else
        raise "Can not create an instance of #{type}. Watir does not support it."

    end
  end
end
