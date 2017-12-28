# Add seed data here. Seed your database with `rake db:seed`

artist = Artist.create(name: "Paul McCartney")
rock = Genre.create(name: "Rock")
pop = Genre.create(name: "Pop")
Song.create(name: "Coming Up", artist: artist, genres: [rock, pop])
