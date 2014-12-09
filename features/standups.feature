Feature: Standups
  As a site user I want to manage my standups

  Background:
    Given I am on the home page
    And I am registered

  @javascript
  Scenario: I create a new standup
    When I click "sign in"
    And I fill "test@gmail.com" as Email
    And I fill "test1234567890" as Password
    And I click "Log in" button
    And I click "New Standup"
    Then I should notice a new standup