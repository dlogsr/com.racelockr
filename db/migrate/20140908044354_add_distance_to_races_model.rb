class AddDistanceToRacesModel < ActiveRecord::Migration
  def change
  	add_column :races, :distance, :number
  	add_column :races, :splits, :time
  end
end
