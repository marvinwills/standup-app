Feature: Standups
  As a site user I want to manage my standups

  Background:
    Given I am registered
    And I am logged in

  @javascript
  Scenario: I create a new standup
    When I click "New Standup"
    Then I should notice a new standup

  @javascript
  Scenario: I add a new yesterday item
    Given I have created a new standup
    When I click "New yesterday item"
    And I fill "Example item" as Item
    And I click "Create Yesterday item" button
    Then I should notice message "Example item"

  @javascript
  Scenario: I unsuccessfully add a new yesterday item
    Given I have created a new standup
    When I click "New yesterday item"
    And I fill "Bad" as Item
    And I click "Create Yesterday item" button
    Then I should notice message "Item is too short (minimum is 5 characters)"

  @javascript
  Scenario: I add a new today item
    Given I have created a new standup
    When I click "New today item"
    And I fill "Example item" as Item
    And I click "Create Today item" button
    Then I should notice message "Example item"