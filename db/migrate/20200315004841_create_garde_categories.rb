class CreateGardeCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :garde_categories do |t|
      t.references :garde, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
