Feature: Sign-up
  As a site visitor a want to be able to access user restricted content

  Background:
  	Given I am on the home page and not logged in

  Scenario: I sign up with valid data
    When I click "Sign up" 
    And I fill "testusername" as "Username"
    And I fill "test@gmail.com" as "Email"
    And I fill "test1234567890" as "Password"
    And I fill "test1234567890" as "Password confirmation"
    And I click "Sign up" button
    Then I should notice message "Welcome! You have signed up successfully."


  Scenario: I sign up with an invalid username (shorter than 5 characters)
    When I click "Sign up" 
    And I fill "test" as "Username"
    And I fill "test@gmail.com" as "Email"
    And I fill "test1234567890" as "Password"
    And I fill "test1234567890" as "Password confirmation"
    And I click "Sign up" button
    Then I should notice message "Username is too short (minimum is 5 characters)"

  Scenario: I sign up with an invalid email
    When I click "Sign up" 
    And I fill "testusername" as "Username"
    And I fill "invalidemail" as "Email"
    And I fill "test1234567890" as "Password"
    And I fill "test1234567890" as "Password confirmation"
    And I click "Sign up" button
    Then I should notice message "Email is invalid"

  Scenario: I sign up with an invalid password
    When I click "Sign up" 
    And I fill "testusername" as "Username"
    And I fill "test@gmail.com" as "Email"
    And I fill "123" as "Password"
    And I fill "123" as "Password confirmation"
    And I click "Sign up" button
    Then I should notice message "Password is too short (minimum is 8 characters)"

  Scenario: I sign up without a password confirmation
    When I click "Sign up" 
    And I fill "testusername" as "Username"
    And I fill "test@gmail.com" as "Email"
    And I fill "12345678" as "Password"
    And I click "Sign up" button
    Then I should notice message "Password confirmation doesn't match Password"

  Scenario: I sign up with a missmathing password confirmation
    When I click "Sign up" 
    And I fill "testusername" as "Username"
    And I fill "test@gmail.com" as "Email"
    And I fill "12345678" as "Password"
    And I fill "12345679" as "Password confirmation"
    And I click "Sign up" button
    Then I should notice message "Password confirmation doesn't match Password"
