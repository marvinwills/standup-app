Feature: Standups
  As a site user I want to edit my account information

  Background:
    Given I am registered
    And I am logged in

  Scenario: I edit my username
    When I click "Edit account"
    And I fill "My new username" as "Username"
    And I provide my password
    And I click "Update" button
    Then I should notice message "My new username"
    And I should notice message "Your account has been updated successfully"

  Scenario: I unsuccessfully edit my username (shorter than 5 characters)
    When I click "Edit account"
    And I fill "Bad" as "Username"
    And I provide my password
    And I click "Update" button
    Then I should notice message "Username is too short (minimum is 5 characters)"

  Scenario: I unsuccessfully edit my username
    When I click "Edit account"
    And I fill "My new username" as "Username"
    And I click "Update" button
    Then I should notice message "Current password can't be blank"

  Scenario: I unsuccessfully edit my username
    When I click "Edit account"
    And I fill "My new username" as "Username"
    And I fill "Not my current password" as "Current password"
    And I click "Update" button
    Then I should notice message "Current password is invalid"


  Scenario: I edit my password
    When I click "Edit account"
    And I fill "My new password" as "Password"
    And I fill "My new password" as "Password confirmation"
    And I provide my password
    And I click "Update" button
    Then I should notice message "Your account has been updated successfully"

  Scenario: I unsuccessfully edit my password (shorter than 8 characters)
    When I click "Edit account"
    And I fill "Bad" as "Password"
    And I fill "Bad" as "Password confirmation"
    And I provide my password
    And I click "Update" button
    Then I should notice message "Password is too short (minimum is 8 characters)"

  Scenario: I unsuccessfully edit my password
    When I click "Edit account"
    And I fill "My new password" as "Password"
    And I fill "My different new password" as "Password confirmation"
    And I provide my password
    And I click "Update" button
    Then I should notice message "Password confirmation doesn't match Password"

  Scenario: I unsuccessfully edit my password
    When I click "Edit account"
    And I fill "My new password" as "Password"
    And I fill "My new password" as "Password confirmation"
    And I click "Update" button
    Then I should notice message "Current password can't be blank"

  Scenario: I unsuccessfully edit my password
    When I click "Edit account"
    And I fill "My new password" as "Password"
    And I fill "My new password" as "Password confirmation"
    And I fill "Not my current password" as "Current password"
    And I click "Update" button
    Then I should notice message "Current password is invalid"

  @javascript
  Scenario: I delete my account
    When I click "Edit account"
    And I click "Cancel my account" button
    And I accept the confirmation
    Then I should notice message "Bye! Your account has been successfully cancelled. We hope to see you again soon."

  Scenario: I cancel editing my account
    When I click "Edit account"
    And I fill "My new username" as "Username"
    And I click "Back"
    Then I should notice message "testusername"
