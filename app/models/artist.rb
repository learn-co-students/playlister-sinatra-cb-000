require_relative "concerns/slug_module.rb"

class Artist < ActiveRecord::Base

  include SlugThis::InstanceMethods
  extend SlugThis::ClassMethods

  has_many :songs
  has_many :genres, through: :songs, source: :song_genres

end
