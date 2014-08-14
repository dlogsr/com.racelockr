class ChangeTimeToString < ActiveRecord::Migration
  # def self.up
  # 	add_column :races, :timestring, :string
  # 	Race.reset_column_information
  # 	Race.all.each do |race|
  # 		race.timestring = race.time.to_s
  # 		race.save
  # 	end
  # 	remove_column :races, :time
  # 	rename_column :races, :timestring, :time
  # end

  # def self.down
  # 	rename_column :races, :time, :timestring
  # 	add_column :races, :time, :integer
  # 	Race.all.each do |race|
  # 		race.time = race.timestring.to_i
  # 		race.save
  # 	end
  # 	remove_column :races, :timestring
  # end
end
