class UserCredentials
  attr_accessor :login, :password, :first_name, :last_name

  def initialize(parameters = {})
    @login = parameters[:login] || nil
    @password = parameters[:password] || nil
    @first_name = parameters[:first_name] || nil
    @last_name = parameters[:last_name] || nil
  end
end