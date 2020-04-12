class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists |t| do
      t.string :name
    end
  end
end
