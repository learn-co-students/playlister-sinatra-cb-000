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
    # That One with the Guitar
    # that-one-with-the-guitar
    slugToName = slug.gsub('-', ' ')
    # slug = slug.gsub(/\w+/, &:capitalize)
    x = Song.arel_table
    Song.where(x[:name].matches("%#{slugToName}%")).first
    # Song.where(name: slugToName).first
    # binding.pry

  end
end
