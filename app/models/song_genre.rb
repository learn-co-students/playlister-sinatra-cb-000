class SongGenre < ActiveRecord::Base
  include Slugifiable
  extend Slugifiable::Find
  
  belongs_to :song
  belongs_to :genre
end
