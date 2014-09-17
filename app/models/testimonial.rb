class Testimonial < ActiveRecord::Base
  validates_presence_of :author, :content

  ActiveAdmin.register Testimonial do
    form do |f|
      f.inputs do
        f.input :author,  :type => :string
        f.input :company,  :type => :string
        f.input :content,  :type => :text, as: :ckeditor
      end
      f.actions
    end

    index do
      selectable_column
      column :id
      column :author
      column :company
      column :content do |testimonial|
        testimonial.content[0,200] + "..."
      end
      column :created_at
      column :updated_at
      actions
    end
  end
end
