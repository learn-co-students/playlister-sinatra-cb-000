# Add seed data here. Seed your database with `rake db:seed`
kanye = Artist.create(name: "Kanye")
pump = Artist.create(name: "Pump")
rap = Genre.create(name: "Rap")
problems = Song.create(name: "problems", artist_id: kanye.id, genre_id: rap.id)
rapproblems = SongGenre.create(genre_id: rap.id, song_id: problems.id )
