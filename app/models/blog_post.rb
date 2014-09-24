class BlogPost < ActiveRecord::Base
  validates_presence_of :title, :content

  has_attached_file :header_image, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :header_image, :content_type => /\Aimage\/.*\Z/

  extend FriendlyId
  friendly_id :title, use: :slugged

  default_scope { order('created_at DESC') }
end