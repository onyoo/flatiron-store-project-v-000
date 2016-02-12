class User < ActiveRecord::Base
  has_many :carts
  has_many :line_items, through: :carts
  has_many :items, through: :line_items
  has_many :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
