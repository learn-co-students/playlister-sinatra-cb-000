class Genre < ActiveRecord::Base
 has_many :song_genres
 has_many :songs, through: :song_genres
 has_many :artists, through: :songs


 def slug
 self.name.split(" ").map { |e| e.downcase  }.join("-")
 end

 def self.find_by_slug(slugged_name)


     self.all.find do |genre|
       genre.slug == slugged_name
     end
 end

end
