#AddEventPage - Contains elements that are on the add event page (cp.scorebig.local/Event/Add)
class LandingPagesWizard1Page < BasePage

  # Modules - Define any modules that the page may contain here.

  #InformationTab
  

  def initialize
    super( "landing pages wizard1",{
    	:name_textfield => {:id => "name", :type => ElementType::Textfield},
    	:choose_campaign_button => $browser.div(:class => "input-prepend input-append asset-chooser")
    } )
  end

end


