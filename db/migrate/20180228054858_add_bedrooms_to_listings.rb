class AddBedroomsToListings < ActiveRecord::Migration[5.0]
  def change

    add_column :listings, :country, :string
    add_column :listings, :bedrooms, :integer 
    add_column :listings, :bathrooms, :integer 

  end
end
