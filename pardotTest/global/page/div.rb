class Div < BaseHtmlElement

  def initialize(div)
    @div = div
    super(div)
  end

  attr_reader :div


end