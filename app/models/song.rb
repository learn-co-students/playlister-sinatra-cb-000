class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  include HelperStuff

  # def slug
  #   self.name.downcase.gsub ' ', '-'
  # end
  #
  # def self.find_by_slug(input)
  #   # binding.pry
  #   self.all.detect {|artist| artist.slug == input}
  # end

end
