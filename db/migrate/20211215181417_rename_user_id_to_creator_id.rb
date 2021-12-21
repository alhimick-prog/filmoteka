class RenameUserIdToCreatorId < ActiveRecord::Migration[6.1]
  def change
    rename_column :films, :users_id, :creator_id
  end
end
