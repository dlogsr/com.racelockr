class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.integer :bibnumber
      t.integer :time
      t.date :date
      t.text :split
      t.text :photos
      t.text :description
      t.integer :user_id

      t.timestamps
    end
    add_index :races, :user_id
    add_index :races, :date
  end
end
