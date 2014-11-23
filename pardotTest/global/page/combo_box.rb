class ComboBox < BaseHtmlElement

  def initialize(combobox)
    @combobox = combobox
    super(combobox)
  end

  attr_reader :combobox



  def select(item)

    begin
        combobox.select(item)
    rescue => e
      if(e.class == Watir::Exception::NoValueFoundException)
        combobox.select_value(item)
      else
        raise e
      end
    end
  end

end