class Cart < ActiveRecord::Base
  belongs_to :line_item
  belongs_to :user
  belongs_to :order
end
