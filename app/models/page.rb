class Page < ActiveRecord::Base
  validates_presence_of :title, :content
  validates_uniqueness_of :title, :case_sensitive => false
  extend FriendlyId
  friendly_id :title, use: :slugged

  HEADER_BACKGROUNDS = ['impossible', 'jigsaw', 'ladder', 'field', 'telescope']
end
