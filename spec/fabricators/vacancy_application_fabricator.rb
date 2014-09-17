Fabricator(:vacancy_application) do
  title 'Mr'
  applicant_first_name 'Joe'
  applicant_last_name 'Bloggs'
  applicant_email 'joebloggs@example.com'
  vacancy_id { Fabricate(:vacancy).id }
end