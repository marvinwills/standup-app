Given(/^I am on the home page$/) do
  visit("/")
end

Given(/^I am not logged in$/) do
  page.should have_content(/^Welcome to Standup App where you sit down to standup Sign up or sign in$/)
end

When(/^I click "(.*?)"$/) do |arg1|
  click_on arg1
end

When(/^I fill "(.*?)" as Username$/) do |arg1|
  fill_in "Username", :with => arg1
end

When(/^I fill "(.*?)" as Email$/) do |arg1|
  fill_in "Email", :with => arg1
end

When(/^I fill "(.*?)" as Password$/) do |arg1|
  fill_in "Password", :with => arg1
end

When(/^I fill "(.*?)" as Password confirmation$/) do |arg1|
  fill_in "Password confirmation", :with => arg1
end

When(/^I click "(.*?)" button$/) do |arg1|
  click_on arg1
end

Then(/^I should notice message "(.*?)"$/) do |arg1|
   page.should have_content(arg1)
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
