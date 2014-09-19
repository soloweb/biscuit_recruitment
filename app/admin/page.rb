ActiveAdmin.register Page do
  permit_params :title, :content, :meta_keywords, :meta_description

	before_filter :only => [:show, :edit, :update, :destroy] do
		@page = Page.find_by_slug!(params[:id])
	end

  form do |f|
    f.inputs do
      f.input :title, :type => :string
      f.input :content,  :type => :text, as: :ckeditor
      f.input :meta_description, :type => :string
      f.input :meta_keywords, :type => :string
    end
    f.actions
  end

  index do
    column :id
    column :title
    column :content do |page|
      page.content[0,300]
    end
    column :created_at
    column :updated_at
    column :slug
    actions
  end
end
