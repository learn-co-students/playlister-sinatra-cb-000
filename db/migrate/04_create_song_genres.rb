class CreateSongGenres < ActiveRecord::Migration
  def up
    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end 
