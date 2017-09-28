# Add seed data here. Seed your database with `rake db:seed`

genre1 = Genre.create(name: "rap")
genre2 = Genre.create(name: "country")

artist1 = Artist.create(name: "Eminem")
artist2 = Artist.create(name: "Sexy")

song1 = Song.create(name:"abc", artist: artist1)
song1 = Song.create(name:"def", artist: artist2)
