Given(/^I have created a new standup$/) do
  click_on "New Standup"
end

Given(/^I have created a new yesterday item$/) do
  click_on "New yesterday item"
  fill_in "Item", :with => "To be edited"
  click_on "Create Item"
  sleep 1
end

Then(/^I shouldn't notice message "(.*?)"$/) do |string|
  page.should_not have_content(string)
end

When(/^I delete a yesterday item$/) do
  click_on "Delete"
  click_on "Yes" 
end

When(/^I cancel deleting a yesterday item$/) do
  click_on "Delete"
  click_on "No"
end
