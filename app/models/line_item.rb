class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item
  has_many :users, through: :cart
end
