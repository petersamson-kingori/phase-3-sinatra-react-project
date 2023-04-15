class CreateBlogsCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs_categories, id: false do |t|
      t.belongs_to :blog
      t.belongs_to :category
    end

    add_index :blogs_categories, [:blog_id, :category_id], unique: true # Add composite primary key
  end
end
