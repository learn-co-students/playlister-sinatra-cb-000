class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres, id: false do |t|
      t.integer :genre_id
      t.integer :song_id
    end

    add_index :song_genres, :genre_id
    add_index :song_genres, :song_id
  end
end
