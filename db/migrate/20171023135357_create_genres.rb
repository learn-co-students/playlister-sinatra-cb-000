class CreateGenres < ActiveRecord::Migration
  # A Genre can have multiple artists and multiple songs

  def change
    create_table :genres do |t|
      t.string :name
    end

  end
end
