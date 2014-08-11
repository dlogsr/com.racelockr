class RemoveRacesIndexUniqueness < ActiveRecord::Migration
  def change
  	remove_index(:races, :user_id)
  end
end
