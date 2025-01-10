class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :purchases
  has_many :comments

  has_one :cart
  has_many :cart_items, through: :carts

  validates :password, length: { minimum: 8 }
end
