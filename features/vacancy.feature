Feature: Vacancy functionality

@javascript
Scenario: Frontpage vacancy search by keyword
  Given There is a vacancy
  And I visit the homepage
  And I fill in the search keywords with "Developer"
  And I click the "Search" button
  Then I should see the job listed


Scenario: Frontpage vacancy search by location
  Given There is a vacancy
  And I visit the homepage
  And I fill in the search location with "Southend"
  And I click the "Search" button
  Then I should see the job listed


Scenario: Frontpage vacancy search by salary
  Given There is a vacancy
  And I visit the homepage
  And I fill in the search salary with "10000"
  And I click the "Search" button
  Then I should see the job listed

Scenario: Frontpage vacancy search with a mixed search combination
  Given There is a vacancy
  And I visit the homepage
  And I fill in the search keywords with "Developer"
  And I fill in the search location with "Southend"
  And I select 'Permanent' from the vacancy type
  And I click the "Search" button
  Then I should see the job listed

Scenario: incorrect search