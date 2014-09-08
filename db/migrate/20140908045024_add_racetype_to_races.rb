class AddRacetypeToRaces < ActiveRecord::Migration
  def change
  	add_column :races, :racetype, :integer
  end
end
