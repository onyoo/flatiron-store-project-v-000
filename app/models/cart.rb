class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
  belongs_to :order

  def total
    line_items.collect do |line_item|
      line_item.item.price * line_item.quantity
    end.inject(:+)
  end

  def add_item(item_id)
    new_item = line_items.find_by(id: item_id)

    if new_item
      new_item.quantity += 1
    else
      new_item = self.line_items.build(item_id: item_id)
      new_item.quantity = 1
    end
    new_item
  end

  def checkout
    line_items.each do |li|
      li.item.inventory -= li.quantity
      li.item.save
    end
    self.line_items.clear
  end
end
