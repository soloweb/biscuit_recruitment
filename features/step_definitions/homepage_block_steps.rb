Given(/^There is a homepage block$/) do
  Fabricate(:homepage_block)
end

Then(/^I should see the homepage blocks title$/) do
  expect(page).to have_content 'Homepage Block Title'
end