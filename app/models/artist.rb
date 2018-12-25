require './app/models/helper_stuff.rb'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  include HelperStuff

end
