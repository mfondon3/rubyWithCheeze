class CheckoutPage
  include PageObject
  include DataMagic
  DataMagic.yml_directory = Dir.pwd
  DataMagic.load('features/config/data/default.yml')


  text_field(:name, :id => 'order_name')
  text_field(:address, :id => 'order_address')
  text_field(:email, :id => 'order_email')
  select_list(:pay_type, :id => 'order_pay_type')
  button(:place_order, :value => 'Place Order')


  def checkout(data ={})
    puts Dir.pwd
    populate_page_with data_for(:checkout_page, data)
    self.place_order
  end

end