class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_many :line_items, through: :carts
  belongs_to :current_cart, class_name: 'Cart', foreign_key: 'id'
end
