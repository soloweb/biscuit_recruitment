ActiveAdmin.register MenuItem do
  permit_params :name, :menu, :link, :page_id, :position
end
