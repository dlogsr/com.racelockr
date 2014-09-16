class AddRaceComments < ActiveRecord::Migration
  def change
  	create_table :race_comments do |t|
  		t.string :content
  		t.integer :race_id
  		t.integer :user_id

  		t.timestamps
  	end
  	add_index :race_comments, [:user_id, :created_at]
  end
end
