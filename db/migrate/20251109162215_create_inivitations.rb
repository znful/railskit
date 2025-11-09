class CreateInivitations < ActiveRecord::Migration[8.1]
  def change
    create_table :inivitations, id: :uuid do |t|
      t.references :account, null: false, foreign_key: true, type: :uuid
      t.string :token
      t.text :message
      t.string :receiver
      t.references :sender, null: false, foreign_key: { to_table: :users }, type: :uuid

      t.timestamps
    end
  end
end
