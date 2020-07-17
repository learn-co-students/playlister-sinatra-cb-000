class CreateGenre < ActiveRecord::Migration
  def change
      create_table :genres do |column|
      column.string :name
  end
end
end
