Given(/^I am on the home page and not logged in$/) do
  visit("/")
  page.should have_content(/^Welcome to Standup App where you sit down to standup Sign up or sign in$/)
end

When(/^I click "(.*?)"$/) do |link|
  click_on link
end

When(/^I fill "(.*?)" as "(.*?)"$/) do |string, field|
  fill_in field, :with => string
end

When(/^I click "(.*?)" button$/) do |button|
  click_on button
end

Then(/^I should notice message "(.*?)"$/) do |string|
   page.should have_content(string)
end

Given(/^I am registered$/) do
  @password = "test1234567890"
  @user = User.create!({username: "testusername", email: "test@gmail.com", password: @password})
end

Given(/^I am logged in$/) do
  visit '/accounts/sign_in'
  fill_in "Email", :with => @user.email
  fill_in "Password", :with => @password
  click_button "Log in"
end

When(/^I provide my password$/) do
  fill_in "Current password", :with => @password
end

When(/^I accept the confirmation$/) do
  page.driver.browser.switch_to.alert.accept
end
