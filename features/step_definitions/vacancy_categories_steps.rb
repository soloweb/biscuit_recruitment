Given(/^There is a vacancy category$/) do
  @vacancy_category = Fabricate(:vacancy_category)
end

Then(/^I should see the vacancy category option$/) do
  expect(page).to have_selector("option[value='#{@vacancy_category.id}']")
end