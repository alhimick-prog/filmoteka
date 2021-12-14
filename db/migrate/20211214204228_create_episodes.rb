class CreateEpisodes < ActiveRecord::Migration[6.1]
  def change
    create_table :episodes do |t|
      t.references :season, null: false, foreign_key: true, index: true
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end
