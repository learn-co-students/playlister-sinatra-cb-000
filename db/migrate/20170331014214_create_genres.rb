class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :genres
    end
  end
end
