class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods

  def self.create_from_web(song_name, artist_name, genres)
    Song.new(name: song_name).tap do |s| 
      s.artist = Artist.find_or_create_by(name: artist_name)
      
      unless !genres || genres.empty?
        genres.each do |genre|
          obj = Genre.find(genre)
          s.song_genres.build(genre: obj)
        end
      end
      s.save
    end
  end

  def self.update_from_web(song_name, artist_name, genres)
    song = Song.find_by_slug(song_name)
    song.artist = Artist.find_or_create_by(name: artist_name)
    song.song_genres.clear

    unless !genres || genres.empty?
      genres.each do |genre|
        obj = Genre.find(genre)
        song.song_genres.build(genre: obj)
      end
    end
    song.save
  end

end

