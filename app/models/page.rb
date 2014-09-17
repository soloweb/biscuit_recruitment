class Page < ActiveRecord::Base
  validates_presence_of :title, :content
  validates_uniqueness_of :title, :case_sensitive => false
  extend FriendlyId
  friendly_id :title, use: :slugged

  HEADER_BACKGROUNDS = ['impossible', 'jigsaw', 'ladder', 'field', 'telescope']

  ActiveAdmin.register Page do
    form do |f|
      f.inputs do
        f.input :title, :type => :string
        f.input :content,  :type => :text, as: :ckeditor
        f.input :header_background, type: :string, as: :select, collection: HEADER_BACKGROUNDS, include_blank: false
        f.input :meta_description, :type => :string
        f.input :meta_keywords, :type => :string
      end
      f.actions
    end

    index do
      column :id
      column :title
      column :content do |page|
        page.content[0,300]
      end
      column :created_at
      column :updated_at
      column :slug
      actions
    end
  end
end
