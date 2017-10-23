require 'pry'
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres

  def slugify(str)
    #Given input "Taylor Swift" returns "taylor-swift"

  end

  def slug

    slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')

  end

  def self.find_by_slug(slug)
    # return artist where name = Taylor Swift
    self.find_by_name(slug.titlecase)
  end
end
