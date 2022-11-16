class AddUserRefToGroups < ActiveRecord::Migration[7.0]
  def change
    # add_reference :groups, :author, references: :users, index: true
    add_column :groups, :author_id, :bigint, null: false
    add_index :groups, :author_id
    add_foreign_key :groups, :users, column: :author_id
  end
end
