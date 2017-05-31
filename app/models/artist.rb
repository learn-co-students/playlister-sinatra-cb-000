class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs



  def slug
  self.name.split(" ").map { |e| e.downcase  }.join("-")
  end

  def self.find_by_slug(slugged_name)

      
      self.all.find do |artist|
        artist.slug == slugged_name
      end
  end

end
