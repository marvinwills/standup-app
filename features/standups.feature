Feature: Standups
  As a site user I want to manage my standups

  Background:
    Given I am registered
    And I am logged in

  @javascript
  Scenario: I create a new standup
    When I click "New Standup"
    Then I should notice a new standup
    