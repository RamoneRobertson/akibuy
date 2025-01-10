class Product < ApplicationRecord
  belongs_to :user
  has_many :comments

  scope :filter_by_price, ->(sales_price) { where("sales_price <= ?", "#{sales_price}") if sales_price.present? }
  scope :filter_by_condition, ->(condition) { where(condition: condition) if condition.present? }
  scope :filter_by_name, ->(name) { where("name ILIKE ?", "%#{name}%") if name.present? }
end
