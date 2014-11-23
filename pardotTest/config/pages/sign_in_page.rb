#AddEventPage - Contains elements that are on the add event page (cp.scorebig.local/Event/Add)
class SignInPage < BasePage

  # Modules - Define any modules that the page may contain here.

  #InformationTab
  

  def initialize
    super( "sign in",{
    	:email_textfield => {:id => "email_address", :type => ElementType::Textfield},
    	:password_textfield => {:id => "password", :type => ElementType::Textfield},
    	:sign_in_button => {:name => "commit", :type => ElementType::Button}

    } )
  end

  def login(email_address, password)
  	self.email_textfield.wait_until_present.set email_address
  	self.password_textfield.wait_until_present.set password
  	self.sign_in_button.click
  end

end


