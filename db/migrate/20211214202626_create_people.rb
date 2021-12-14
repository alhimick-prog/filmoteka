class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.datetime :birthday
      t.datetime :death_date

      t.timestamps
    end
  end
end
