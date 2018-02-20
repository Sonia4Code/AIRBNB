class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
        t.string :user_id
        t.string :listing_id
        t.integer :guests
        t.integer :total_price
        t.date :check_in
        t.date :check_out 
      t.timestamps
    end
  end
end
