class ChangeNumberToFloat < ActiveRecord::Migration
  def change
  	change_column :races, :distance, :float
  	change_column :races, :racetype, :integer
  end
end
