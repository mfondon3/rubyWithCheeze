#AddEventPage - Contains elements that are on the add event page (cp.scorebig.local/Event/Add)
class LandingPagesPage < BasePage

  # Modules - Define any modules that the page may contain here.

  #InformationTab
  

  def initialize
    super( "landing pages",{
    	:add_landing_button => {:text => "Add landing page", :type => ElementType::Link}
    } )
  end


end


