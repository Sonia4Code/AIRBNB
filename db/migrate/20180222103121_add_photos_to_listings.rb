class AddPhotosToListings < ActiveRecord::Migration[5.0]
  def change
    
    remove_column :listings, :avatars, :text, default: []
    add_column :listings, :avatars, :JSON
  end
end
