class CreateFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :films do |t|
      t.string :title, null: false
      t.text :description
      t.text :trailer_url
      t.datetime :release_date, null: false, default: '01.01.1970'
      t.integer :duration, null: false
      t.integer :age_restriction, null: false, default: 0

      t.timestamps null: false
    end
  end
end
