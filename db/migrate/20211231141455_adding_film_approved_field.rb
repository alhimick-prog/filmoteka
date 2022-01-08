class AddingFilmApprovedField < ActiveRecord::Migration[6.1]
  def change
    add_column :films, :approved, :boolean, null: false, default: false
  end
end
