class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def self.create_from_web(args)
    song = self.new(name: args[:name])
    song.artist = Artist.find_or_create_by(name: args[:artist])
    args[:genres].each do |genreid|
      song.genres << Genre.find(genreid)
    end
    song.save
    song
  end

  def self.update_from_web(s,args)
    puts "editing"
    song = s
    song = self.new(name: args[:name])
    song.artist = Artist.find_or_create_by(name: args[:artist])
    args[:genres].each do |genreid|
      song.genres << Genre.find(genreid)
    end
    song.save
    song
  end

include Memorable::InstanceMethods
extend Memorable::ClassMethods

end