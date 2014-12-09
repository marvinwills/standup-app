Feature: Sign-in
  As a site user I want to access my data

  Background:
    Given I am on the home page
    And I am registered

  Scenario: I sign up with valid data
    When I click "sign in"
    And I fill "test@gmail.com" as Email
    And I fill "test1234567890" as Password
    And I click "Log in" button
    Then I should notice message "Signed in successfully."