class Song < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  
  belongs_to :artist # table name artist, forigen_key: artist_id
  has_many :song_genres
  has_many :genres, through: :song_genres
end
