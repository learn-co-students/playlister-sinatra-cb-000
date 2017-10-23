class CreateArtists < ActiveRecord::Migration
  # An Artist can have multiple songs and multiple genres

  def change
    create_table :artists do |t|
      t.string :name
    end
  end
end
