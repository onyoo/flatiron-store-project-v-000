class LineItemsController < ApplicationController
  before_action :initialize_cart, only: [:create]

  def create
    line_item = current_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to current_cart,
      notice: 'Item added to cart!'
    else
      redirect_to store_path
    end
  end

end
