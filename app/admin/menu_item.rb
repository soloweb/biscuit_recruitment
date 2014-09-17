ActiveAdmin.register MenuItem do
  permit_params :name, :menu, :link, :page_id, :position

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
