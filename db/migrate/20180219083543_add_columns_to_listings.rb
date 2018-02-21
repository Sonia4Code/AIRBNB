class AddColumnsToListings < ActiveRecord::Migration[5.0]
  def change
  	add_column :listings, :description, :text
  	add_column :listings, :guests, :integer 
  	add_column :listings, :living_space , :text
  	add_column :listings, :amenities, :text, array:true, default: []
  end
end
