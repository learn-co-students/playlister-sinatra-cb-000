class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
def slug
    downcased_name = self.name.downcase
    downcased_name.gsub(/\s+/, '-')
  end
  
  def self.find_by_slug(slug)
    split_slug = slug.split("-")
    array = split_slug.map {|word| word.capitalize}
    word = array.join(" ")
    self.all.each do |artist|
      if genre.name == word
        return genre
      end
    end
  end
  
end