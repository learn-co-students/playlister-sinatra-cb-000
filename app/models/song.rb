class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres


  def slug
  self.name.split(" ").map { |e| e.downcase  }.join("-")
  end

  def self.find_by_slug(slugged_name)


      self.all.find do |song|
        song.slug == slugged_name
      end
  end

end
