Then(/^I should notice a new standup$/) do
  page.should have_content(DateTime.now.to_date)
end
