require './app/models/helper_stuff.rb'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  include HelperStuff

  # def slug
  #   self.name.downcase.gsub ' ', '-'
  # end
  #
  # def self.find_by_slug(input)
  #   # binding.pry
  #   Artist.all.detect {|artist| artist.slug == input}
  # end

end
