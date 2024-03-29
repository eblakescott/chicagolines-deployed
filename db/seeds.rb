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

location = Location.create({image_url: 'planetarium.jpg', name: 'Planetarium', description: %{<p> The Adler Planetarium & Astronomy Museum in Chicago, Illinois was the first planetarium built in the Western Hemisphere and is the oldest in existence today. Adler was founded and built in 1930 by the philanthropist Max Adler, with the assistance of the first director of the planetarium, Philip Fox. The Adler Planetarium opened to the public on May 12, 1930.</p>}, category: 'museum'})
waits = location.waits.create([
  { duration: '10' },
  { duration: '15' },
  { duration: '20' }
])

location = Location.create({image_url: 'field_museum_2.jpg', name: 'Field Museum', description: %{<p>The Field Museum of Natural History (abbreviated FMNH) is located in Chicago, Illinois, USA. It sits on Lake Shore Drive next to Lake Michigan, part of a scenic complex known as the Museum Campus Chicago. The museum collections contain over 21 million specimens, of which only a small portion are ever on display. The president of the museum is Richard W. Lariviere.</p>}, category: 'museum', address: '1400 S Lake Shore Drive, Chicago, IL', map_image_url: 'map_field_museum.png'})
waits = location.waits.create([
  { duration: '10' },
  { duration: '15' },
  { duration: '20' }
])

location = Location.create({image_url: 'shedd_aquarium.jpg', name: 'Shedd Aquarium', description: %{<p>The Shedd Aquarium (formally the John G. Shedd Aquarium) is an indoor public aquarium in Chicago, Illinois in the United States that opened on May 30, 1930. The aquarium contains over 25,000 fish, and was for some time the largest indoor aquarium in the world with 5,000,000 US gallons (19,000,000 l; 4,200,000 imp gal) of water. The Shedd Aquarium was the first inland aquarium with a permanent saltwater fish collection. It is surrounded by Museum Campus Chicago, which it shares with the Adler Planetarium and the Field Museum of Natural History.</p>}, category: 'museum' })
waits = location.waits.create([
  { duration: '10' },
  { duration: '15' },
  { duration: '20' }
])

location = Location.create({image_url: 'bar.jpg', name: 'Bar', description: %{<p>The Field Museum of Natural History (abbreviated FMNH) is located in Chicago, Illinois, USA. It sits on Lake Shore Drive next to Lake Michigan, part of a scenic complex known as the Museum Campus Chicago. The museum collections contain over 21 million specimens, of which only a small portion are ever on display. The president of the museum is Richard W. Lariviere.</p>}, category: 'bar'})
waits = location.waits.create([
  { duration: '10' },
  { duration: '15' },
  { duration: '20' }
])

location = Location.create({image_url: 'club.jpg', name: 'Club', description: %{<p>The Field Museum of Natural History (abbreviated FMNH) is located in Chicago, Illinois, USA. It sits on Lake Shore Drive next to Lake Michigan, part of a scenic complex known as the Museum Campus Chicago. The museum collections contain over 21 million specimens, of which only a small portion are ever on display. The president of the museum is Richard W. Lariviere.</p>}, category: 'club'})
waits = location.waits.create([
  { duration: '10' },
  { duration: '15' },
  { duration: '20' }
])

location = Location.create({image_url: 'event.jpg', name: 'Event', description: %{<p>The Field Museum of Natural History (abbreviated FMNH) is located in Chicago, Illinois, USA. It sits on Lake Shore Drive next to Lake Michigan, part of a scenic complex known as the Museum Campus Chicago. The museum collections contain over 21 million specimens, of which only a small portion are ever on display. The president of the museum is Richard W. Lariviere.</p>}, category: 'event'})
waits = location.waits.create([
  { duration: '10' },
  { duration: '15' },
  { duration: '20' }
])

location = Location.create({image_url: 'restaurant.jpg', name: 'Restaurant', description: %{<p>The Field Museum of Natural History (abbreviated FMNH) is located in Chicago, Illinois, USA. It sits on Lake Shore Drive next to Lake Michigan, part of a scenic complex known as the Museum Campus Chicago. The museum collections contain over 21 million specimens, of which only a small portion are ever on display. The president of the museum is Richard W. Lariviere.</p>}, category: 'restaurant'})
waits = location.waits.create([
  { duration: '10' },
  { duration: '15' },
  { duration: '20' }
])
