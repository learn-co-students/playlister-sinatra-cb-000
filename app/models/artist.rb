class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  
  def slug
    downcased_name = self.name.downcase
    downcased_name.gsub(/\s+/, '-')
  end
  
  def self.find_by_slug(slug)
    split_slug = slug.split("-")
    array = split_slug.map {|word| word.capitalize}
    word = array.join(" ")
    self.all.each do |artist|
      if artist.name == word
        return artist
      end
    end
  end
  
end