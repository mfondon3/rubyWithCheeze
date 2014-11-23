class Link  < BaseHtmlElement
  def initialize(link)
    @link = link
    super(link)
  end

  attr_reader :link


end