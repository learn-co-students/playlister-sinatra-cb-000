class CreateSonggenre < ActiveRecord::Migration
  def change
    #many to many songs to genres relationship
    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
