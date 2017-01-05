class Artist < ActiveRecord::Base

  include Slugs::InstanceMethods
  extend Slugs::ClassMethods

  #gives us <a>.songs
  has_many :songs
  #gives us <a>.genres and works because songs gets its genres through song_genres table
  has_many :genres, through: :songs

  # def slug
  #   self.name.gsub(' ', '-').downcase
  # end
  #
  # def self.find_by_slug(slug)
  #   #take a slug "taylor-swift" and returns class artist instace with matching name
  #   #first need to turn slug into nonslug
  #   nonslug = slug.gsub('-', ' ').split.collect{ |word| word.capitalize}.join(' ')
  #   #binding.pry
  #   self.all.find_by(name: nonslug)
  # end
end
