class AddUserFkToFilms < ActiveRecord::Migration[6.1]
  def change
    add_reference :films, :users, index: true, foreign_key: true
  end
end
