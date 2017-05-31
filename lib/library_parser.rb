class LibraryParser
  def files
    data_path = File.join(File.dirname(__FILE__), '..', 'db', 'data') #gives the path to the data
    Dir.entries(data_path)[2..-1] #puts the data from the above path into an array, ignoring the first two entries as they are path residuals
  end

  def self.parse
    self.new.call
  end

  def parse_filename(filename)
    artist_match = filename.match(/^(.*) -/)
    song_match   = filename.match(/- (.*) \[/)
    genre_match  = filename.match(/\[([^\]]*)\]/)

    artist = artist_match && artist_match[1]
    song   = song_match   && song_match[1]
    genre  = genre_match  && genre_match[1]
=begin
    artist = artist.split(" ").map {|e| e.downcase}.join(" ")
    song = song.split(" ").map {|e| e.downcase}.join(" ")
    genre = genre.split(" ").map {|e| e.downcase}.join(" ")
=end
    [artist, song, genre]
  end

  def call
    files.each do |filename|
      parts = parse_filename(filename)
      build_objects(*parts)
    end
  end

  def build_objects(artist_name, song_name, genre_name)

    song = Song.create(name: song_name)
    genre = Genre.find_or_create_by(name: genre_name)
    artist = Artist.find_or_create_by(name: artist_name)

    song.song_genres.build(genre: genre)
    song.artist = artist

    song.save
  end
end
