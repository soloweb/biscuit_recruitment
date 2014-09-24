ActiveAdmin.register BlogPost do
  permit_params :title, :content, :slug, :meta_keywords, :meta_description, :header_image

  before_filter :only => [:show, :edit, :update, :destroy] do
    @blog_post = BlogPost.find_by_slug!(params[:id])
  end

  before_save do |blog_post|
    blog_post.author_id = current_admin_user.id
  end

  form do |f|
    f.inputs do
      f.input :title, :type => :string
      f.input :content,  :type => :text, as: :ckeditor
      f.input :meta_description, :type => :string
      f.input :meta_keywords, :type => :string
      f.input :header_image
    end
    f.actions
  end

  index do
    column :id
    column :title
    column :content do |blog_post|
      blog_post.content[0,300]
    end
    column :created_at
    column :updated_at
    column :slug
    actions
  end
end
