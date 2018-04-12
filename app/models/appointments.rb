class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs
end

class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :appointments
  has_many :genres, :through => :appointments
end

class Appointment < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre
end

class Genre < ActiveRecord::Base
  has_many :appointments
  has_many :songs, :through => :appointments
end
