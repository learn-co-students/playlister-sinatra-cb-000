class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres,  :through => :songs

  extend Slugable::Class_methods
  include Slugable::Instance_methods

end
