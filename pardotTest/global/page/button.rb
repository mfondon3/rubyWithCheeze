class Button < BaseHtmlElement

  def initialize(button)
    @button = button
    super(button)
  end

  attr_reader :button


end