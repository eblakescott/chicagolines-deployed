class Location < ActiveRecord::Base
  attr_accessible :category, :description, :image_url, :name
end
