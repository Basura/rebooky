class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :property, foreign_key: true
      t.references :contact, foreign_key: true
    end
  end
end
