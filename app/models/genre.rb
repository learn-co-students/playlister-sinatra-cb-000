class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres

  has_many :artists, through: :songs

  def slug
    # not sure why self.name is better than @name here
    self.name.downcase.gsub(/\s/, '-')
  end

  def self.find_by_slug(slug)
    # reverse the slug to name?
    slugToName = slug.gsub('-', ' ')
    # slug = slug.gsub(/\w+/, &:capitalize)
    x = Genre.arel_table
    Genre.where(x[:name].matches("%#{slugToName}%")).first
    # binding.pry

  end
end
