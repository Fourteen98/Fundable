class AddUserRefToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchases, :author, references: :users, index: true
  end
end
