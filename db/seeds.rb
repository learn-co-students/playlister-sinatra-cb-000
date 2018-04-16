# Add seed data here. Seed your database with `rake db:seed`
Artist.destroy_all
Song.destroy_all
Genre.destroy_all

weird_al = Artist.create(name: "Weird Al")
blink_182 = Artist.create(name: "Blink 182")

rock = Genre.create(name: "Rock")
comedy = Genre.create(name: "Comedy")

song1 = Song.create(name: "She's Out Of Her Mind", artist_id: "2")
song2 = Song.create(name: "Bored To Death", artist_id: "2")
song3 = Song.create(name: "Fat", artist_id: "1")

song1.artist = blink_182
song1.genres << rock
song2.artist = blink_182
song2.genres << rock
song3.artist = weird_al
song3.genres << comedy

song1.save
song2.save
song3.save
