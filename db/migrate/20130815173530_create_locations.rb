class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :locid
      t.integer :activity_object_id
      t.integer :rating

      t.timestamps
    end

    add_index "locations", ["activity_object_id"], :name => "index_locations_on_activity_object_id"
    add_index "locations", ["locid"], :name => "index_locations_on_locid"
    add_foreign_key "locations", "activity_objects", :name => "locations_on_activity_object_id"
  end

  def self.down
    drop_table :locations
  end
end
