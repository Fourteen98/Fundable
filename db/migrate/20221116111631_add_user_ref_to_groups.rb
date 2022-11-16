class AddUserRefToGroups < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :author, references: :users, index: true
  end
end
