class CreateJoinTableAccountUserPermission < ActiveRecord::Migration[8.1]
  def change
    create_join_table :account_users, :permissions do |t|
      t.index [ :account_user_id, :permission_id ]
      t.index [ :permission_id, :account_user_id ]
    end
  end
end
