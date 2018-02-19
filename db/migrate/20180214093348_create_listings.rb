class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|

		t.string   :user_id	
    	t.string   :location
    	t.string   :property_type
    	t.integer  :price


      t.timestamps
    end
  end
end
