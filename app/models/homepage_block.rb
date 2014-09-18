class HomepageBlock < ActiveRecord::Base
  has_attached_file :image, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :title, unless: :text?
  validates_presence_of :text, unless: :title?

  ALIGNMENT_OPTIONS = ['left', 'right']

  validates_presence_of :alignment, :image
  validates_inclusion_of :alignment, in: ALIGNMENT_OPTIONS

  acts_as_list

  def alignment_class
    case alignment
    when 'left'
      'block-align-left'
    when 'right'
      'block-align-right'
    else
      'block-align-none'
    end
  end

  ActiveAdmin.register HomepageBlock do
    form do |f|
      f.inputs do
        f.input :title
        f.input :text
        f.input :alignment, as: :select, collection: ALIGNMENT_OPTIONS, include_blank: false
        f.input :image
      end
      f.actions
    end
  end

end