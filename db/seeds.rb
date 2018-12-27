# Add seed data here. Seed your database with `rake db:seed`

anthem = Artist.create(name: "Gaslight anthem")
against_me = Artist.create(name: "Against me!")
trio = Artist.create(name: "Alkaline trio")
arms = Artist.create(name: "The Lawrence Arms")

forty_five = Song.create(name: "45")
cliche = Song.create(name: "Cliche Guevera")
mercy_me = Song.create(name: "Mercy me")
escapes = Song.create(name: "Great lakes/Great escapes")

punk = Genre.create(name: "Punk")
rock = Genre.create(name: "Rock")
pop = Genre.create(name: "Pop")
folk = Genre.create(name: "Folk")


anthem.songs << forty_five
cliche.artist = against_me
trio.songs << mercy_me
escapes.artist = arms

# anthem.genres << punk
# rock.artists << against_me
# trio.genres << pop
# arms.genres << folk
