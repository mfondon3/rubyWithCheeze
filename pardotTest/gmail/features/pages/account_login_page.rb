class AccountLoginPage
  include PageObject

  text_field(:email, :id => "Email")
  text_field(:password, :id => "Passwd")
  button(:sign_in, :id => "signIn")

  def login_with(email, password)
    self.email = email
    self.password = password
    self.sign_in
  end
end



