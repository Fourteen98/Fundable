class AddUserRefToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchases, :author, references: :users, index: true
    # add_column :purchases, :author_id, :bigint, null: false
    # add_index :purchases, :author_id
    # add_foreign_key :purchases, :users, column: :author_id
  end
end
