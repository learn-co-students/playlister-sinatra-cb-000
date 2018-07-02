require_relative "concerns/slug_module.rb"
require 'pry'

class Artist < ActiveRecord::Base
  include SlugThis::InstanceMethods
  extend SlugThis::ClassMethods
  
  has_many :songs 
  has_many :genres, through: :songs

 # binding.pry

end