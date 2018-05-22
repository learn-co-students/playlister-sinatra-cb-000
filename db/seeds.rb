bazzi = Artist.create(name: "Bazzi")

honest = Song.create(name: "Honest")
mine = Song.create(name: "Mine")

pop = Genre.create(name: "Pop")

##
honest.genres << pop
mine.genres << pop

bazzi.songs << honest
bazzi.songs << mine

#########

rihanna = Artist.create(name: "Rihanna")

work = Song.create(name: "Work")
diamonds = Song.create(name: "Diamonds")

hiphop = Genre.create(name: "Hip Hop")

##
work.genres << hiphop
diamonds.genres << pop

rihanna.songs << work
rihanna.diamonds << diamonds
