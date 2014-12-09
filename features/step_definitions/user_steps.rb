Given(/^I am on the home page$/) do
  visit("/")
end

Given(/^I am not logged in$/) do
  page.should have_content(/^Welcome to Standup App where you sit down to standup Sign up or sign in$/)
end

When(/^I click "(.*?)"$/) do |link|
  click_on link
end

When(/^I fill "(.*?)" as Username$/) do |string|
  fill_in "Username", :with => string
end

When(/^I fill "(.*?)" as Email$/) do |string|
  fill_in "Email", :with => string
end

When(/^I fill "(.*?)" as Password$/) do |string|
  fill_in "Password", :with => string
end

When(/^I fill "(.*?)" as Password confirmation$/) do |string|
  fill_in "Password confirmation", :with => string
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
  fill_in "Email", :with => @user[:email]
  fill_in "Password", :with => @password
  click_button "Log in"
end
