class AddRacetypeToRaces < ActiveRecord::Migration
  def change
  	add_column :races, :racetype, :number
  end
end
