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
end
