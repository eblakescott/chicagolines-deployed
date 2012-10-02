# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
# cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# Mayor.create(name: 'Emanuel', city: cities.first)


# Using the .delete_all method on a given model deletes any existing records;
# note that it may be better to run
    # $ rake db:drop
# followed by
    # $ rake db:migrate
# before running
    # $ rake db:seed
# to seed your data.

Page.delete_all

# Rails is smart enough to create individual records from an array of hashes.
# This seed data will create a Welcome and About page. Note the %{ } shorthand
# syntax for longer strings.

pages = Page.create([
  { title: 'Welcome', content: %{ This is the home page. } },
  { title: 'About', content: %{ This is the about page. } }
  ])

# Now we'll build some more intricate seed data; this sample app allows for the entry
# of locations and for people to add wait times to the locations.
# To show the associations at work, we'll build a few waits on each location. Note that
# the waits are created off of the location. instance; that is how Rails keeps track of
# the ID, even for new records, for the location_id column on Waits.

location = Location.create({image_url: 'planetarium.jpg', name: 'Planetarium', description: %{<p> The Adler Planetarium & Astronomy Museum in Chicago, Illinois was the first planetarium built in the Western Hemisphere and is the oldest in existence today. Adler was founded and built in 1930 by the philanthropist Max Adler, with the assistance of the first director of the planetarium, Philip Fox. The Adler Planetarium opened to the public on May 12, 1930.</p>}, category: 'Museum'})
waits = location.waits.create([
  { duration: '10' },
  { duration: '15' },
  { duration: '20' }
])
