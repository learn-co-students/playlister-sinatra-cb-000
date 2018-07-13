require_relative "concerns/slug_module.rb"

class Song < ActiveRecord::Base

  include SlugThis::InstanceMethods
  extend SlugThis::ClassMethods

  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist
end
