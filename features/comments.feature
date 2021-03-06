Feature: Comments
  As a site user I want to comment standups

  Background:
    Given I am registered
    And I am logged in

  @javascript
  Scenario: I add a comment
    Given I have created a new standup
    When I click "Add comment"
    And I fill "Example comment text" as "Text"
    And I click "Create Comment" button
    Then I should notice message "Example comment text"

  @javascript
  Scenario: I cancel adding a comment
    Given I have created a new standup
    When I click "Add comment"
    And I fill "Example comment text" as "Text"
    And I click "Cancel"
    Then I shouldn't notice message "Example comment text"

  @javascript
  Scenario: I try to add a blank comment
    Given I have created a new standup
    When I click "Add comment"
    And I fill "" as "Text"
    And I click "Create Comment"
    Then I should notice message "Text can't be blank"
