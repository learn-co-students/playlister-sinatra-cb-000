class RenameSongsGenresTable < ActiveRecord::Migration
  def change
    rename_table(:songs_genres, :genres_songs)
  end
end
