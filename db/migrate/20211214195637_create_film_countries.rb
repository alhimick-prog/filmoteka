class CreateFilmCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :film_countries do |t|
      t.references :country, null: false, index: true, foreign_key: true
      t.references :film, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
