class Page < ActiveRecord::Base
  has_attached_file :header_image, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :header_image, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :title, :content
  validates_uniqueness_of :title, :case_sensitive => false
  extend FriendlyId
  friendly_id :title, use: :slugged
end
