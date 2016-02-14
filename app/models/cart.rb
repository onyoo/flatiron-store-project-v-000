class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    line_items.collect do |line_item|
      line_item.item.price *= line_item.quantity
    end.inject(:+)
  end

  def add_item(item_id)
    new_item = self.line_items.find_by(item_id: item_id)
    if new_item
      new_item.quantity += 1
    else
      new_item = self.line_items.build(item_id: item_id)
      new_item.quantity = 1
    end
    new_item
  end

  def checkout
    line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.save
    end
  end
end
