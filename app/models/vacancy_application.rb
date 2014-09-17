class VacancyApplication < ActiveRecord::Base
  belongs_to :vacancy
  validates_presence_of :vacancy_id, :applicant_first_name, :applicant_last_name, :applicant_email, :title
  has_attached_file :cv
  has_attached_file :cover_letter
  validates_attachment :cv, :cover_letter, :content_type => { content_type: 
    [ 
      'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 
      'text/plain', 'application/pdf', 'application/vnd.ms-word', 'application/vnd.oasis.opendocument.text',
      'application/x-vnd.oasis.opendocument.text',
      'application/rtf', 'application/x-rtf', 'text/rtf', 'text/richtext', 'application/doc'
   ]}, size: { in: 0..2.megabytes }



  def applicant_full_name
    applicant_first_name + " " + applicant_last_name
  end

  ActiveAdmin.register VacancyApplication do
    config.sort_order = "created_at_desc"
    actions :all, except: [:new, :create, :edit, :destroy]
    show do |vacancy_application|
      attributes_table do
        row :id
        row :title
        row :applicant_first_name
        row :applicant_last_name
        row :applicant_email
        row :created_at
        row :updated_at
        row :vacancy_id do
          if vacancy_application.vacancy
            link_to(vacancy_application.vacancy.title, admin_vacancy_path(vacancy_application.vacancy))
          else
            'Vacancy no longer exists'
          end
        end
        row :cv do
          if vacancy_application.cv.exists?
            link_to(vacancy_application.cv_file_name, vacancy_application.cv.url)
          end
        end
        row :cover_letter do
          if vacancy_application.cover_letter.exists?
            link_to(vacancy_application.cover_letter_file_name, vacancy_application.cover_letter.url)
          end
        end
      end
      active_admin_comments
    end

    index do
      column :id
      column :title
      column :applicant_first_name
      column :applicant_last_name
      column :applicant_email
      column :created_at
      column :updated_at
      column :vacancy_id do |vacancy_application|
        if vacancy_application.vacancy
          link_to(vacancy_application.vacancy.title, admin_vacancy_path(vacancy_application.vacancy))
        else
          'Vacancy no longer exists'
        end
      end
      column "CV" do |vacancy_application|
        if vacancy_application.cv.exists?
          link_to(vacancy_application.cv_file_name, vacancy_application.cv.url)
        else
          'No CV uploaded'
        end
      end
      column "Cover Letter" do |vacancy_application|
        if vacancy_application.cover_letter.exists?
          link_to(vacancy_application.cover_letter_file_name, vacancy_application.cover_letter.url)
        else
          'No cover letter uploaded'
        end
      end
      actions
    end
  end
end
