class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Artist.all.find{|artist| artist.slug == slug}
  end

  def self.find_or_create_by_name(name)
    name_slug = name.downcase.gsub(" ", "-")
    artist = Artist.find_by_slug(name_slug)
    if artist
      artist
    else
      Artist.create(name: name)
    end
  end
end
