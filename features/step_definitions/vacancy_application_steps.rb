Given(/^I fill in the application form$/) do
  fill_in 'vacancy_application_applicant_first_name', with: 'Joe'
  fill_in 'vacancy_application_applicant_last_name', with: 'Bloggs'
  fill_in 'vacancy_application_applicant_email', with: 'joebloggs@example.com'
end

Then(/^The application should be submitted$/) do
  expect(VacancyApplication.all.count).to eq(1)
end

Then(/^The application should not be submitted$/) do
  expect(VacancyApplication.all.count).to eq(0)
end

Given(/^I visit the vacancies page$/) do
  visit vacancies_path
end

Given(/^I click the Apply Now link$/) do
  find("a.apply").click
end