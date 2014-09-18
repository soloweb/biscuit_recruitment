ActiveAdmin.register HomepageBlock do
  permit_params :title, :text, :position, :alignment, :image

  config.sort_order = 'position_asc'
  config.paginate   = false
  sortable

  index do
    selectable_column
    sortable_handle_column
    column :id
    column :title
    column :text
    column :position
    column :created_at
    column :updated_at
    actions
  end
end
