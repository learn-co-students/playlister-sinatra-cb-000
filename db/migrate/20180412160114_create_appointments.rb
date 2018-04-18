class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.timestamps
    end

    create_table :songs do |t|
      t.belongs_to :artist
      t.string :name
      t.timestamps
    end

    create_table :genres do |t|
      t.string :name
      t.timestamps
    end

    create_table :song_genres do |t|
      t.belongs_to :song, index: true
      t.belongs_to :genre, index: true
      t.timestamps
    end
  end
end
