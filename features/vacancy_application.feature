Feature: Application process

Scenario: submitting a successful application
  Given There is a vacancy
  And I visit the vacancy show page
  And I click the "Apply" link
  And I fill in the application form
  And I click the "Apply" button
  Then The application should be submitted

Scenario: submitting a blank application
  Given There is a vacancy
  And I visit the vacancy show page
  And I click the "Apply" link
  And I click the "Apply" button
  Then The application should not be submitted