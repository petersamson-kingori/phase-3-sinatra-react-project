class CreateCategorizations < ActiveRecord::Migration[6.1]
  def change
    create_table :categorizations do |t|
      t.references :blog, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end