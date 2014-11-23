class Li < BaseHtmlElement

  def initialize(li)
    @li = li
    super(li)
  end

  attr_reader :li

end