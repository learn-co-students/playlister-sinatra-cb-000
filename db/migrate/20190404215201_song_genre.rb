class SongGenre < ActiveRecord::Migration
  def change
      create_table :song_genres do |column|
      column.string :song_id
      column.string :genre_id
  end
end
end
