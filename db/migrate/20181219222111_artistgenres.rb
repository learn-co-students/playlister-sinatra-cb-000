class Artistgenres < ActiveRecord::Migration
  def change
    create_table :artist_genres do |t|
      t.integer :genre_id
      t.integer :artist_id
    end
  end
end
