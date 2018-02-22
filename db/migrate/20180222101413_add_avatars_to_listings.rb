class AddAvatarsToListings < ActiveRecord::Migration[5.0]
  def change

    add_column :listings, :avatars, :text, array:true, default: []
    remove_column :listings, :avatar, :string

  end
end
