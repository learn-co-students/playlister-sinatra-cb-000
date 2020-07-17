class CreateSong < ActiveRecord::Migration
  def change
      create_table :songs do |column|
      column.string :name
  end
end
end
