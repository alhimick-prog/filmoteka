class CreateWatchItems < ActiveRecord::Migration[6.1]
  def change
    create_table :watch_items do |t|
      t.references :film, null: false, index: true, foreign_key: true
      t.references :user, null: false, index: true, foreign_key: true
      t.integer :status, null: false, index: true

      t.timestamps
    end
  end
end
