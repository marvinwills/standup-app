Feature: Sign-up
  As a site visitor a want to be able to access user restricted content

  Background:
  	Given I am on the home page
  	And I am not logged in

  Scenario: I sign up with valid data
    When I click "Sign up" 
    And I fill "testusername" as Username
    And I fill "test@gmail.com" as Email
    And I fill "test1234567890" as Password
    And I fill "test1234567890" as Password confirmation
    And I click "Sign up" button
    Then I should notice message "Welcome! You have signed up successfully."
