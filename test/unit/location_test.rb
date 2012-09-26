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

def new_location(image_url)
    Location.new(image_url:   image_url,
		name:       "My Location",
                description: "yyy",
                category:       "mmm")
end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    ok.each do |name|
      assert new_location(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_location(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "location is not valid without a unique name" do
    location = Location.new(image_url:   "fred.gif",
			  name:       	 locations(:ruby).name,
                          description: "yyy", 
                          category:    "mmm")

    assert location.invalid?
    assert_equal ["has already been taken"], location.errors[:name]
  end

  test "location is not valid without a unique name - i18n" do
    location = Location.new(image_url:   "fred.gif",
			  name:        locations(:ruby).name,
                          description: "yyy", 
                          category:    "mmm")

    assert location.invalid?
    assert_equal [I18n.translate('activerecord.errors.messages.taken')],
                 location.errors[:name]
  end

end
