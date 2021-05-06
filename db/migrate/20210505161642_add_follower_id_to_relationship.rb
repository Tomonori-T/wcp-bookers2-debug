class AddFollowerIdToRelationship < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :follower_id, :integer
  end
  add_index :relationships, :follower_id
end
