class AddDefaultAccountFieldToUser < ActiveRecord::Migration[8.1]
  def change
    add_reference :users, :default_account, null: false, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
