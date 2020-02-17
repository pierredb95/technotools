class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_rent
      t.date :end_rent
      t.references :user, foreign_key: true
      t.references :vinyl, foreign_key: true

      t.timestamps
    end
  end
end
