class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :line_items
  has_many :carts, through: :line_item
end
