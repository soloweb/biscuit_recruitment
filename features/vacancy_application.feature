Feature: Application process

@javascript
Scenario: submitting a successful application
  Given There is a vacancy
  And I visit the vacancies page
  And I click the "Apply Now" link
  And I fill in the application form
  And I click the "Submit application" button
  Then The application should be submitted

Scenario: submitting a blank application
  Given There is a vacancy
  And I visit the vacancies page
  And I click the Apply Now link
  And I click the "Submit application" button
  Then The application should not be submitted
  And I should see "There was a problem submitting your application"