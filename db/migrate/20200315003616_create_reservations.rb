class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :reservation_quantity, default: 0
      t.date :pick_up_date, default: Date.today
      t.text :reservation_comment
      t.string :status, default: "en attente"
      t.references :user, foreign_key: true
      t.references :garde, foreign_key: true

      t.timestamps
    end
  end
end
