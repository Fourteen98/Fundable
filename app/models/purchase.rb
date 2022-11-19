class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_purchases

  validates :name, presence: true
  validates :amount, presence: true
end
