class ChangeSongGenreIdToGenreIds < ActiveRecord::Migration
  def change
    rename_column :songs, :genre_id, :genre_ids
  end
end
