ActiveAdmin.register Vacancy do
  permit_params :title, :company, :description, :salary_information, :description, :location, :vacancy_type, :published
end
