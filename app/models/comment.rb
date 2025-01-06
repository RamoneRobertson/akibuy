class Comment < ApplicationRecord
  belongs_to :products
  belongs_to :users

  validates :content, length: { maximum: 140 }
end
