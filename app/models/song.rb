class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres


  def slug
    # not sure why self.name is better than @name here
    self.name.downcase.gsub(/\s/, '-')
  end

  def self.find_by_slug(slug)
    # reverse the slug to name?
    slugToName = slug.gsub('-', ' ').gsub(/\w+/, &:capitalize)
    # slug = slug.gsub(/\w+/, &:capitalize)


    Song.where(name: slugToName).first
    # binding.pry

  end
end
