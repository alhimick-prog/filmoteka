class ChangeFilmReleaseDate < ActiveRecord::Migration[6.1]
  def change
    change_column_default :films, :release_date, from: '01.01.1970', to: '01.01.1895'
  end
end
