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
  Scenario: I edit a yesterday item
    Given I have created a new standup
    And I have created a new yesterday item
    And I click "Edit"
    And I fill "" as Item
    And I fill "Edited item" as Item
    And I click "Update Yesterday item" button
    Then I should notice message "Edited item"

  @javascript
  Scenario: I cancel editing a yesterday item
    Given I have created a new standup
    And I have created a new yesterday item
    And I click "Edit"
    And I fill "Edited item" as Item
    And I click "Cancel"
    Then I should notice message "To be edited"

  @javascript
  Scenario: I add a new today item
    Given I have created a new standup
    When I click "New today item"
    And I fill "Example item" as Item
    And I click "Create Today item" button
    Then I should notice message "Example item"