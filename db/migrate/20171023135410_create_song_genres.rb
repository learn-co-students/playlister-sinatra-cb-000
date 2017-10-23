class CreateSongGenres < ActiveRecord::Migration
  # How would we implement the relationship of a song having many genres and genre having many songs? In order to establish a "many-to-many" relationship, we'll need a join table. You will need a SongGenre class to go along with this table in the database

  def change
    create_table :song_genres do |t|
      t.integer :genre_id
      t.integer :song_id
    end
  end
end
