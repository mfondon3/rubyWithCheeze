class BasePage < BaseTestObject

  def initialize(page_name, element_hash)
    @page_name = page_name
    super(element_hash)
  end

  attr_reader :page_name

  def navigate_to
    $browser.navigate(page_name)
  end

  def contains(text)
      Watir::Wait.until(timeout = 10) {
        $browser.html.include?(text)
      }
  end

  def url
    $browser.page_url_lookup(page_name)
  end

  def generate_unique_name(name)
    name += "" + DateTime.now.to_s
  end

  def chooseDefaultCampaign()
    $browser.div(:class => "input-prepend input-append asset-chooser").click
    #$browser.div(:id => "folder-contents").div.div(:class => "ember-list-container").div(:class => "ember-view ember-list-item-view").click
    $browser.div(:class => "well well-small media folder-row clearfix").when_present.click
    $browser.button(:value => "Choose Selected").click
  end


end