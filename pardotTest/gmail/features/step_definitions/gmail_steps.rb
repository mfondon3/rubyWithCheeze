And(/^I sign in$/) do
	$account_login_page.login_with $user.login, $user.password

end

When(/^I navigate to the Landing Page page$/) do
	$landing_pages_page.navigate_to
end

And(/^I create a new landing page$/) do
	$landing_pages_page.add_landing_button.wait_until_present.click
	$landing_pages_wizard1_page.name_textfield.write($landing_pages_wizard1_page.generate_unique_name "Test landing page")
	$landing_pages_wizard1_page.chooseDefaultCampaign
	#$landing_pages_wizard1_page.choose_campaign_button.click
end

