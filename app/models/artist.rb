require 'pry'
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres

  before_save :slugify

  # def after_initialize
  #   self.slug = self.slugify
  #   self.save
  # end

  def slugify
    self.slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(str)
    # return artist where name = Taylor Swift
    self.find_by(slug: str)
  end
end

# find_by_slug works in testing, but the after_initialize isn't functioning correctly.
