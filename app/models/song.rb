class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  include Slugging::InstanceMethods
  extend Slugging::ClassMethods
end
