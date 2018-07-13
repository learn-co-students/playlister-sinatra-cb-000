require_relative "concerns/slug_module.rb"

class Genre < ActiveRecord::Base

  include SlugThis::InstanceMethods
  extend SlugThis::ClassMethods

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
