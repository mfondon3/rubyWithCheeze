Feature: Landing Pages
	As a Pardot User
	I want to access the Landing Page page
	In order to execute CRUD task on landing pages

  Background:
	Given I am on the puppy adoption site

    @one
  Scenario: Adopting one puppy
    When I click the View Details button for "Brook"
	And I click the Adopt Me button
	And I click the Complete the Adoption button
	And I enter "Cheezy" in the name field
	And I enter "123 Main Street" in the address field
    And I enter "cheezy@example.com" in the email field
    And I select "Credit card" from the pay with dropdown
    And I click the Place Order button
	Then I should see "Thank you for adopting a puppy!"

  @two
  Scenario: Adopting two puppies
   When I click the View Details button for "Brook"
   And I click the Adopt Me button
   And I click the Adopt Another Puppy button
   And I click the second View Details button
   And I click the Adopt Me button
   And I click the Complete the Adoption button
   And I enter "Cheezy" in the name field
   And I enter "123 Main Street" in the address field
   And I enter "cheezy@example.com" in the email field
   And I select "Credit card" from the pay with dropdown
   And I click the Place Order button
   Then I should see "Thank you for adopting a puppy!"