class Wait < ActiveRecord::Base
  attr_accessible :duration, :location_id
  belongs_to :location

#See http://techoctave.com/c7/posts/23-rails-date-formats
  def my_time
    updated_at.strftime("%B %-d %Y at %I:%M")
  end
end

