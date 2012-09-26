require 'test_helper'

class LocationTest < ActiveSupport::TestCase
test "location attributes must not be empty" do
location = Location.new
assert location.invalid?
assert location.errors[:image_url].any?
assert location.errors[:name].any?
assert location.errors[:description].any?
assert location.errors[:category].any?
end

end
