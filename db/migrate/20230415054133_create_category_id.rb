class CreateCategoryId < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :category_id, :integer
    add_index :blogs, :category_id
  end
end
