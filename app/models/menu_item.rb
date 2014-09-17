class MenuItem < ActiveRecord::Base
  validates_presence_of :name, :menu
  validates_presence_of :page_id, :unless => :link?
  validates_presence_of :link, :unless => :page_id?
  validate :link_or_page_provided
  MENU_TYPES = %w[top]

  acts_as_list scope: 'menu=\'#{menu}\''

  belongs_to :page
  validates_inclusion_of :menu, in: MENU_TYPES

  private

  def link_or_page_provided
    if page_id.blank? && link.blank?
      errors.add(:page_id, "cannot be blank")
      errors.add(:link, "cannot be blank")
    elsif page_id.present? && link.present?
      errors.add(:page_id, "cannot be entered if a link is provided")
      errors.add(:link, "cannot be entered if a page is provided")
    end
  end
end
