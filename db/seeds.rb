# Add seed data here. Seed your database with `rake db:seed`
zucchero = Artist.create(name: "Zucchero")
pop = Genre.create(name: "pop")
donne = Song.create(name: "Donne")
donne_pop = SongGenre.create( song_id: donne.id , genre_id: pop.id)


LibraryParser.parse
