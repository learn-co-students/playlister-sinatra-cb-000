# Add seed data here. Seed your database with `rake db:seed`

artist_list = ["Michael Jackson", "Reggie Jackson", "Motell Jordan", "Bieber" ]

artist_list.each do |name|
  Artist.create( name: name)
end


genre_list = [
  [ "R&B", 2 ],
  [ "Jazz", 4 ],
  [ "Hip Hop", 3],
  [ "Pop", 1 ]
]

genre_list.each do |name, artistID|
  Genre.create( name: name, artist_id: artistID)
end

song_list = [
  [ "PYT", 1, 4 ],
  [ "Rock With You", 2, 2 ],
  [ "Get it on Tonight", 3, 3],
  [ "Love You Girl", 4, 4 ]
]

song_list.each do |name, artist_id, g_id|
  Song.create( name: name, artist_id: artist_id, genre_id: g_id)
end