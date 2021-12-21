class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.bigint :commentable_id
      t.string :commentable_type
      t.references :user, null: false, foreign_key: true, index: true
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
