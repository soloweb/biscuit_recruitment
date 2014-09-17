ActiveAdmin.register Page do
  permit_params :title, :content, :meta_keywords, :meta_description, :header_background

	before_filter :only => [:show, :edit, :update, :destroy] do
		@page = Page.find_by_slug!(params[:id])
	end
end
