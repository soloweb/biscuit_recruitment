class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string  :title
      t.text  :content
      t.integer :author_id
      t.string  :slug
      t.string  :meta_keywords
      t.string  :meta_description
      t.attachment  :header_image
      t.timestamps
    end
  end
end
