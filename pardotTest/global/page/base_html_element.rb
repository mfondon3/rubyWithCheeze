class BaseHtmlElement

  def initialize(element)
    @element = element
  end

  attr_reader :element

   def click
    element.click
   end

  def wait_until_present(timeout = 30)
    element.wait_until_present(timeout)
    element
  end

  def when_present
    element.when_present
    element
  end

  def text
    element.text
  end

  def flash
    element.flash
  end

  def attribute_value(value)
    element.attribute_value(value)
  end

end