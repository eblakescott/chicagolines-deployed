class AddAddressToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :address, :string
    add_column :locations, :map_image_url, :string
  end
end
