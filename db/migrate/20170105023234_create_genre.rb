class CreateGenre < ActiveRecord::Migration
  def change
    #genre has many songs and many artists
    create_table :genres do |t|
      t.string :name
    end
  end
end
