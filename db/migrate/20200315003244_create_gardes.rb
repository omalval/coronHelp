class CreateGardes < ActiveRecord::Migration[5.2]
  def change
    create_table :gardes do |t|
      t.string :name
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :contact
      t.integer :quantity_max
      t.date :start_availability_date
      t.date :end_availability_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
