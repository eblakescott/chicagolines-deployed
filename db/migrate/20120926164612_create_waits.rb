class CreateWaits < ActiveRecord::Migration
  def change
    create_table :waits do |t|
      t.integer :duration
      t.integer :location_id

      t.timestamps
    end
  end
end
