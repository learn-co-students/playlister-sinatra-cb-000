class DropAll < ActiveRecord::Migration
  def change
    drop_table :artists
    drop_table :songs
    drop_table :genres
    drop_table :songgenre
  end
end
