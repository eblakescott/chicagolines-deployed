class Wait < ActiveRecord::Base
  attr_accessible :duration, :location_id
  belongs_to :location
end

