class User < ActiveRecord::Base
  has_many :carts
  has_many :line_items, through: :carts
  has_many :items, through: :line_items
  has_many :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def current_cart=(cart)
    carts.unshift(cart)
  end

  def current_cart
    if !self.carts[0].nil? && Cart.where(id: self.carts[0].id) != []
      carts[0]
    else
      nil
    end
  end

end
