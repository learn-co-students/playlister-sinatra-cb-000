class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, :through => :song_genres
  belongs_to :artist

  extend Slugable::Class_methods
  include Slugable::Instance_methods

end
