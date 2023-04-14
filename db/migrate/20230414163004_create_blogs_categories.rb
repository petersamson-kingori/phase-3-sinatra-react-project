class CreateBlogsCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs_categories, id: false do |t|
      t.belongs_to :blog
      t.belongs_to :category
    end
  end
end