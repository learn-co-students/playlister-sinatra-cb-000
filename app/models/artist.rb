class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs
  
  def slug
    name.gsub(/[^0-9a-z ]/i, '').gsub(' ','-').downcase
  end
  
  def self.find_by_slug(slug)
    Artist.all.find{ |artist| artist.slug == slug}
  end
  
  
end