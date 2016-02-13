class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
  belongs_to :order

  def total
    line_items.collect{ |line_item| line_item.item.price }.inject(:+)
  end

  def add_item(item_id)
    new_item = self.line_items.build(item_id: item_id)
    if new_item.quantity.nil?
      new_item.quantity = 1
    else
      new_item.quantity += 1
    end
    new_item
  end

end
