class CreateAccountUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :account_users, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :account, null: false, foreign_key: true, type: :uuid
      t.integer :role, null: false

      t.timestamps
    end
  end
end
