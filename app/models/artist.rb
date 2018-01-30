class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  include Slugging::InstanceMethods
  extend Slugging::ClassMethods
end
