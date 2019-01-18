class Artist < ActiveRecord::Base
  include Slugifiable
  extend Slugifiable::Find

  has_many :songs
  has_many :genres, through: :songs
end
