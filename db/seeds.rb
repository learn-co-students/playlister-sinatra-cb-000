# Add seed data here. Seed your database with `rake db:seed`
kanye = Artist.create(name: "Kanye")
pump = Artist.create(name: "Pump")
rap = Genre.create(name: "Rap")
punk = Genre.create(name: "Punk")
problems = Song.create(name: "99 problems", artist_id: kanye.id)
gang = Song.create(name: "Gucci Gang", artist_id: pump.id)
rapproblems = SongGenre.create(genre_id: rap.id, song_id: problems.id )
rapgang = SongGenre.create(genre_id: rap.id, song_id: gang.id )
