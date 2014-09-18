class Vacancy < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_full_text, :against => [:title, :description, :company]

  has_many :vacancy_applications
  belongs_to :vacancy_category
	validates_presence_of :title, :salary_information, :description, :location, :vacancy_category

  VACANCY_TYPES = %w[Permanent Temporary Contract]
  validates_inclusion_of :vacancy_type, in: VACANCY_TYPES

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  default_scope { order('created_at DESC') }
  scope :published, -> { where(published: true) }

  ActiveAdmin.register Vacancy do
  permit_params :title, :company, :description, :salary_information, :description, :location, :vacancy_type, :published

  config.sort_order = "created_at_desc"
    form do |f|
      f.inputs do
        f.input :published, as: :select, collection: [['Published', true], ['Unpublished', false]], include_blank: false
        f.input :vacancy_category, as: :select, collection: VacancyCategory.all, include_blank: false
        f.input :title,  :type => :string
        f.input :company,  :type => :string
        f.input :vacancy_type, as: :select, collection: VACANCY_TYPES, include_blank: false
        f.input :location,  :type => :string
        f.input :salary_information, type: :string
        f.input :description, :type => :text, :as => :ckeditor
      end
      f.actions
    end
    index do
      column :id
      column :title
      column :company
      column :vacancy_type
      column :salary_information
      column :description do |vacancy|
        vacancy.description[0,300]
      end
      column :location
      column :published
      column :created_at
      column :updated_at
      actions
    end

    show do |vacancy_application|
      attributes_table do
        row :id
        row :title
        row :company
        row :vacancy_type
        row :salary_information
        row :description do |vacancy|
          vacancy.description[0,300]
        end
        row :location
        row :published do |vacancy|
          vacancy.published? ? 'Published' : 'Unpublished'
        end
        row :created_at
        row :updated_at
      end
      active_admin_comments
    end
  end
end