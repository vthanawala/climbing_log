class AddClimbCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :climbs_count, :integer
  end
end
