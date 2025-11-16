class AddCurrentAccountToSession < ActiveRecord::Migration[8.1]
  def change
    add_reference :sessions, :account, null: true, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
