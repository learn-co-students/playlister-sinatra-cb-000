class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres
  
  def slug
    name.gsub(/[^0-9a-z ]/i, '').gsub(' ','-').downcase
  end
  
  def self.find_by_slug(slug)
    Song.all.find{ |song| song.slug == slug}
  end
end