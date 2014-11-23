Feature: Landing Pages
	As a Pardot User
	I want to access the Landing Page page
	In order to execute CRUD task on landing pages

	@Test
	Scenario: Navigate to Landing Page
		Given I am a engineer user
		And I am signed in
		When I navigate to the Landing Page page
		And I create a new landing page

