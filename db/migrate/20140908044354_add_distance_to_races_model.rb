class AddDistanceToRacesModel < ActiveRecord::Migration
  def change
  	add_column :races, :distance, :float
  	add_column :races, :splits, :time
  end
end
