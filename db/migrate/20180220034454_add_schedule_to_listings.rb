class AddScheduleToListings < ActiveRecord::Migration[5.0]
  def change
  	add_column :listings , :schedule , :text
  end
end
