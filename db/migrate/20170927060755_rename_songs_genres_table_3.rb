class RenameSongsGenresTable3 < ActiveRecord::Migration
  def change
    rename_table(:song_genres, :genres_songs)
  end
end
