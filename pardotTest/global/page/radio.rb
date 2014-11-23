class Radio < BaseHtmlElement

  def initialize(radio)
    @radio = radio
    super(radio)
  end


  def choose
   radio.set
  end

  attr_reader :radio

end