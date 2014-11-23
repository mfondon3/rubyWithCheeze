class CheckBox < BaseHtmlElement

  def initialize(checkbox)
    @checkbox = checkbox
    super(checkbox)
  end

  attr_reader :checkbox

  def uncheck
    checkbox.clear
  end

  def check
    checkbox.set
  end

end