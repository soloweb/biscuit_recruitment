class MenuItem < ActiveRecord::Base
  validates_presence_of :name, :menu
  validates_presence_of :page_id, :unless => :link?
  validates_presence_of :link, :unless => :page_id?
  validate :link_or_page_provided
  MENU_TYPES = %w[top]

  acts_as_list scope: 'menu=\'#{menu}\''

  belongs_to :page
  validates_inclusion_of :menu, in: MENU_TYPES

  ActiveAdmin.register MenuItem do
    form do |f|
      f.inputs do
        f.input :menu, as: :select, collection: MENU_TYPES, include_blank: false
        f.input :name, :type => :string
        f.input :page_id, :label => 'Page', :as => :select, :collection => Page.all, include_blank: 'Please select a page or set a link'
        f.input :link, :type => :string
      end
      f.actions
    end

    config.sort_order = 'position_asc'
    config.paginate   = false

    sortable

    index do
      # selectable_column
      column :id
      column :name
      column :menu
      column :link
      column :page_id do |menu_item|
        if menu_item.page
          link_to(menu_item.page.title, admin_page_path(menu_item.page))
        end
      end
      column :position
      column :created_at
      column :updated_at
      sortable_handle_column
      actions
    end
  end


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
