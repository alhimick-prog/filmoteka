class CreateFilmCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :film_categories do |t|
      t.references :film, null: false, foreign_key: true, index: true
      t.references :category, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
