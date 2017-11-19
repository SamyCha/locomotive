class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :price
      t.integer :total

      t.timestamps
    end
  end
end
