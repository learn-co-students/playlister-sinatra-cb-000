class RenameSongsGenresTable2 < ActiveRecord::Migration
  def change
    rename_table(:genres_songs, :song_genres)
  end
end
