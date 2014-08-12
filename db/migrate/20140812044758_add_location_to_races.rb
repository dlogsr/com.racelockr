class AddLocationToRaces < ActiveRecord::Migration
  def change
  	add_column :races, :location, :string
  end
end
