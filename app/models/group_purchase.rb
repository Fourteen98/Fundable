class GroupPurchase < ApplicationRecord
  belongs_to :group # , class_name: 'Group'
  belongs_to :purchase # , class_name: 'Purchase'

  validates :group_id, presence: true, numericality: { greater_than: 0 }
  validates :purchase_id, presence: true, numericality: { greater_than: 0 }
end
