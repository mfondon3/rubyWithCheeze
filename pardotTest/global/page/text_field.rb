class TextField < BaseHtmlElement

  def initialize(textfield)
    @textfield = textfield
    super(textfield)
  end

  attr_reader :textfield

  def write(text)
     textfield.when_present.set text
  end
end