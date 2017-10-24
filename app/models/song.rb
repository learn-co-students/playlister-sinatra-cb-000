class Song < ActiveRecord::Base
belongs_to :artist
has_many :song_genres
has_many :genres, through: :song_genres


before_save :slugify

def slugify
  # binding.pry
  self.slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
end


def self.find_by_slug(str)
  # binding.pry
  self.find_by(slug: str)
end

end
