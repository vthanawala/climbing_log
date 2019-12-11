class CreateClimbs < ActiveRecord::Migration[5.1]
  def change
    create_table :climbs do |t|
      t.integer :user_id
      t.integer :location_id
      t.string :rating
      t.string :picture

      t.timestamps
    end
  end
end
