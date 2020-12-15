class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title
      t.text :body
      t.json :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
