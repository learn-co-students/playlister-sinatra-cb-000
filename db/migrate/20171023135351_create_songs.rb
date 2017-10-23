class CreateSongs < ActiveRecord::Migration
  # A Song can belong to ONE Artist and multiple genres

  def change
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
    end
  end
end
