
class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :appointments
  has_many :genres, :through => :appointments

  def self.find_by_slug(slug)
    self.all.find { |x| x.slug == slug }
  end
 
  def slug
     name.gsub(/[^A-Za-z0-9-]/, '-').gsub(/^-+/,'').downcase
   end

  def artist_name
    Artist.find(artist_id).name
  end
end
