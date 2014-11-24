Given(/^I am on the puppy adoption site$/) do
	@browser.goto("http://puppies.herokuapp.com")
	visit_page(HomePage)
end

When /^I click the View Details button for "([^"]*)"$/ do | name |
	on_page(HomePage).select_puppy name
end

When(/^I click the Adopt Me button$/) do
	on_page(DetailPage).add_to_cart
end

When(/^I click the Complete the Adoption button$/) do
	on_page(ShoppingCartPage).proceed_to_checkout
end

When(/^I enter "(.*?)" in the name field$/) do |name|
	on_page(CheckoutPage).name = name
end

When(/^I click the Adopt Another Puppy button$/) do
	on_page(ShoppingCartPage).continue_adopting
end

When(/^I click the second View Details button$/) do
	@current_page.select_puppy_number 2
end

When(/^I enter "(.*?)" in the address field$/) do |address|
	on_page(CheckoutPage).address = address
end

When(/^I enter "(.*?)" in the email field$/) do |email|
	on_page(CheckoutPage).email = email
end

When(/^I select "(.*?)" from the pay with dropdown$/) do |pay_type|
	on_page(CheckoutPage).pay_type = pay_type
end

When(/^I click the Place Order button$/) do
	on_page(CheckoutPage).place_order
end

Then(/^I should see "(.*?)"$/) do |expected|
	@current_page.text.should include expected
end

Then /^I should see "([^"]*)" as the name for (line item \d+)$/ do |name,line_item|
	on_page(ShoppingCartPage).name_for_line_item(line_item).should include name
end

When /^I should see "([^"]*)" as the subtotal for (line item \d+)$/ do |subtotal,line_item|
		on_page(ShoppingCartPage).subtotal_for_line_item(line_item).should == subtotal
end

When /^I should see "([^"]*)" as the cart total$/ do |total|
	on_page(ShoppingCartPage).cart_total.should == total
end