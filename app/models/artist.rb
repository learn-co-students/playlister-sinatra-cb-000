class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.gsub(/\W/, '-').downcase
  end

  def self.find_by_slug(slug)
    Artist.all.select do |artist|
      artist if artist.slug == slug
    end.first
  end
end
