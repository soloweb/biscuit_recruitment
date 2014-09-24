class BlogPost < ActiveRecord::Base
  belongs_to :admin_user, foreign_key: :author_id
  validates_presence_of :title, :content

  has_attached_file :header_image, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :header_image, :content_type => /\Aimage\/.*\Z/

  extend FriendlyId
  friendly_id :title, use: :slugged

  default_scope { order('created_at DESC') }

  def author
    admin_user
  end

end