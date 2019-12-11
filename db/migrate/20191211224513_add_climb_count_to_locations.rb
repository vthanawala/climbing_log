class AddClimbCountToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :climbs_count, :integer
  end
end
