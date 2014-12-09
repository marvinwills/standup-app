Then(/^I should notice a new standup$/) do
  page.should have_content(DateTime.now.to_date)
end

Given(/^I have created a new standup$/) do
  click_on "New Standup"
end

When(/^I fill "(.*?)" as Item$/) do |string|
  fill_in "Item", :with => string
end

Given(/^I have created a new yesterday item$/) do
  click_on "New yesterday item"
  fill_in "Item", :with => "To be edited"
  click_on "Create Yesterday item"
end