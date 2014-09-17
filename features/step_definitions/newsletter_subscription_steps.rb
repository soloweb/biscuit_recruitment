Given(/^I fill in the newsletter subscription field$/) do
  fill_in 'newsletter_subscriber_email', with: 'jack@soloweb.com'
end

Given(/^I click the newsletter subscription submit button$/) do
  find("#newsletter_subscription_submit").click
end

Then(/^I should be subscribed to the newsletter$/) do
  expect(page).to have_content 'jack@soloweb.com has been signed up to the newsletter'
  expect(NewsletterSubscriber.count).to eq(1)
end