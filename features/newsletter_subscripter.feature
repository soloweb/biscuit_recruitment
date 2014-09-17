Feature: Newsletter subscriptions

@javascript
Scenario: Signing up to a newsletter
  Given I visit the homepage
  And I fill in the newsletter subscription field
  And I click the newsletter subscription submit button
  Then I should be subscribed to the newsletter