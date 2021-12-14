class CreateFilmPeople < ActiveRecord::Migration[6.1]
  def change
    create_table :film_people do |t|
      t.references :film, null: false, foreign_key: true, index: true
      t.references :person, null: false, foreign_key: true, index: true
      t.integer :role

      t.timestamps
    end
  end
end
