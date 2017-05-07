class SongGenre < ActiveRecord::Base
  include Slugifiable
  belongs_to :genre # rails will get the table from the class named Genre
  # the forigen_key genre_id based on the :genre
  belongs_to :song
end
