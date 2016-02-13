class LineItemsController < ApplicationController

  def create
    current_user.find_cart.add_item(params[:item_id]).save
    redirect_to cart_path(current_user.current_cart)
  end

end
