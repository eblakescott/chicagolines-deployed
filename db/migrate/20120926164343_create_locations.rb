class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :image_url
      t.string :name
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
