Given(/^I am an? (.+) user$/) do | role |
	case role
	when "engineer"
		$user = UserCredentials.new(login: "engineer@pardot.com", password: "pardot07")
	when "marketing"
	when "administrator"
	else
		$user = UserCredentials.new(login: "coordinator@pardot.com", password: "coordinator")
	end 
end

And(/^I am signed in$/) do
	$sign_in_page.login($user.login,$user.password)
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