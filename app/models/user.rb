class User < ApplicationRecord
  has_many :groups, through: :author_id
  has_many :purchases, through: :author_id
end
