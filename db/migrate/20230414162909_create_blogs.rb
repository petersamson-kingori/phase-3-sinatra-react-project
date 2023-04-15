class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.belongs_to :category # Add a foreign key reference to categories table
      t.timestamps
    end
  end
end
