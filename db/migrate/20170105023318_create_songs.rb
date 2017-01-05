class CreateSongs < ActiveRecord::Migration
  def change
    #song belongs to 1 artist and many genres
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
    end
  end
end
