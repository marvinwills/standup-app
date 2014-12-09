Then(/^I should notice a new standup$/) do
  page.should have_content(DateTime.now.to_date)
end

Given(/^I have created a new standup$/) do
  click_on "New Standup"
end

When(/^I fill "(.*?)" as Item$/) do |string|
  fill_in "Item", :with => string
end