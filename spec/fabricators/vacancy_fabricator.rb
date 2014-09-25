Fabricator(:vacancy) do
  title 'Web Developer'
  vacancy_category_id { Fabricate(:vacancy_category).id }
  company 'Solopress'
  salary_information '£90,000 - £100,000 plus benefits'
  description 'Join the team at solopress!'
  location 'Southend-on-sea'
  vacancy_type 'Permanent'
end