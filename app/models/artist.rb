class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def self.find_by_slug(slug)
    self.all.find { |x| x.slug == slug }
   end
 
   def slug
     name.gsub(/[^A-Za-z0-9-]/, '-').gsub(/^-+/,'').downcase
   end
end
