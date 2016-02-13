class CartsController < ApplicationController

  def checkout
    current_user.current_cart.checkout
    current_user.carts.unshift nil
    binding.pry
    redirect_to cart_path(current_user.current_cart)
  end

end
