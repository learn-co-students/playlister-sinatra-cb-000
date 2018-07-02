require_relative "concerns/slug_module.rb"
require 'pry'

class Song < ActiveRecord::Base 
  belongs_to :artist 
  has_many :song_genres
  has_many :genres, through: :song_genres
  
  include SlugThis::InstanceMethods
  extend SlugThis::ClassMethods
end