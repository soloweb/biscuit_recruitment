class Vacancy < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_full_text, :against => [:title, :description, :company]

  has_many :vacancy_applications
	validates_presence_of :title, :salary, :salary_information, :description, :location

  VACANCY_TYPES = %w[Permanent Temporary Contract Part-time]
  validates_inclusion_of :vacancy_type, in: VACANCY_TYPES

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  default_scope { order('created_at DESC') }
  scope :published, -> { where(published: true) }
end
