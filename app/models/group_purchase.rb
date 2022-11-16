class GroupPurchase < ApplicationRecord
  belongs_to :group # , class_name: 'Group'
  belongs_to :purchase # , class_name: 'Purchase'
end
