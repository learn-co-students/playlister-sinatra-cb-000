class CreateArtist < ActiveRecord::Migration
  def change
    #artis has multiple songs and multiple genres
    create_table :artists do |t|
      t.string :name
    end
  end
end
