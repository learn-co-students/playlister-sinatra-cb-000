class Genre < ActiveRecord::Base
  has_many :appointments
  has_many :songs, :through => :appointments
  has_many :artists, :through => :songs

  def self.find_by_slug(slug)
    self.all.find { |x| x.slug == slug }
   end

   def slug
     name.gsub(/[^A-Za-z0-9-]/, '-').gsub(/^-+/,'').downcase
   end
end
