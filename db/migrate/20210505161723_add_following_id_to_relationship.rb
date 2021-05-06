class AddFollowingIdToRelationship < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :following_id, :integer
  end
  add_index :relationships, :following_id
  add_index :relationships, %i[follower_id following_id], unique: true
end
