
class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def self.find_by_slug(slug)
    self.all.find { |x| x.slug == slug }
  end
 
  def slug
    STDERR.puts "the name is ->#{name}<- for the new #{self.class}"
     name.gsub(/[^A-Za-z0-9-]/, '-').gsub(/^-+/,'').downcase
   end

  def artist_name
    Artist.find(artist_id).name
  end

  def artist_slug
    Artist.find(artist_id).slug
  end
end
