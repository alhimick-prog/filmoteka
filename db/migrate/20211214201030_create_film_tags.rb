class CreateFilmTags < ActiveRecord::Migration[6.1]
  def change
    create_table :film_tags do |t|
      t.references :film, null: false, foreign_key: true, index: true
      t.references :tag, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
