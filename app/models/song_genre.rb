class SongGenre < ActiveRecord::Base
  belongs_to :genre
  belongs_to :song

  include Slugging::InstanceMethods
  extend Slugging::ClassMethods
end
