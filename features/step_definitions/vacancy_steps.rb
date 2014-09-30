Given(/^There is a vacancy$/) do
  @vacancy = Fabricate(:vacancy)
end

Given(/^I visit the vacancy path$/) do
  visit vacancy_path(@vacancy)
end


Given(/^I fill in the search keywords with "(.*?)"$/) do |arg1|
  fill_in 'keywords', with: arg1
end

Then(/^I should see the job listed$/) do
  # save_screenshot('screens/search_clicked.png', full: true)
  expect(page).to have_content 'Web Developer'
end

Given(/^I fill in the search salary with "(.*?)"$/) do |arg1|
  fill_in 'keywords', with: arg1
end