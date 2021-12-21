class CreateFilmGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :film_genres do |t|
      t.references :film, null: false, foreign_key: true, index: true
      t.references :genre, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
