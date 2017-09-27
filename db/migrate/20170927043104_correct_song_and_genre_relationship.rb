class CorrectSongAndGenreRelationship < ActiveRecord::Migration
  def change
    remove_column(:songs, :genre_id)

    create_table :songs_genres, id: false do |t|
      t.belongs_to :song, index: true
      t.belongs_to :genre, index: true
    end

  end
end
