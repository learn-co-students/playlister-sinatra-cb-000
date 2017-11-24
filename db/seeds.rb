# Add seed data here. Seed your database with `rake db:seed`
Song.delete_all
Artist.delete_all
Genre.delete_all

sone = Song.create(name: "Ice Ice Baby")
stwo = Song.create(name: "All Star")
sthree = Song.create(name: "Cats in the Cradle")
sfour = Song.create(name: "Same Love")

aone = Artist.create(name: "Vanilla Ice")
atwo = Artist.create(name: "Smash Mouth")
athree = Artist.create(name: "Ugly Kid Joe")
afour = Artist.create(name: "Macklemore, Ryan Lewis & Mary Lambert")

gone = Genre.create(name: "Hip Hop")
gtwo = Genre.create(name: "Rock")
gthree = Genre.create(name: "Punk")
gfour = Genre.create(name: "Pop")
gfive = Genre.create(name: "Ballad")

aone.songs << sone
atwo.songs << stwo
athree.songs << sthree
afour.songs << sfour

sone.genres << gone
stwo.genres << gtwo
stwo.genres << gthree
sthree.genres << gtwo
sfour.genres << gfour
sfour.genres << gfive

