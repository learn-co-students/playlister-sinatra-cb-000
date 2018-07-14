class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  
  
  def slug
    downcased_name = self.name.downcase
    downcased_name.gsub(/\s+/, '-')
  end
  
  def self.find_by_slug(slug)
    split_slug = slug.split("-")
    array = split_slug.map {|word| word.capitalize}
    word = array.join(" ")
    self.all.each do |song|
      if song.name == word
        return song
      end
    end
  end
end