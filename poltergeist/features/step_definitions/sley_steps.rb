Given(/^I am on the home page$/) do
  puts  visit "http://sley.fi/"
end

When(/^I click link "([^"]*)"$/) do |link|
  click_link(link)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |element, text|
  page.save_screenshot("~/Desktop/test.pdf")
  fill_in element, with: text
end

Then(/^I should see "([^"]*)"$/) do |text|
  page.save_screenshot("~/Desktop/test2.pdf")
  page.should have_content text
end
