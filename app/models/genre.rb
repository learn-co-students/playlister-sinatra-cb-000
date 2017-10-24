class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres

  before_save :slugify


  def slugify
    self.slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
  def self.find_by_slug(str)

    self.find_by(slug: str)
  end

end
