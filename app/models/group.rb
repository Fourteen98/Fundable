class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_purchases

  validates :name, presence: true
  validates :icon, presence: true
end
