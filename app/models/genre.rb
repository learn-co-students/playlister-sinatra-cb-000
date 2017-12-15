class Genre < ActiveRecord::Base
  extend Helpers::ClassMethods
  include Helpers::InstanceMethods
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  has_many :song_genres
end
