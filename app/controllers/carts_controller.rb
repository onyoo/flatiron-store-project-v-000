class CartsController < ApplicationController

  def checkout
    set_cart
    @cart.checkout
    Cart.destroy(@cart.id)
    redirect_to cart_path(@cart)
  end

  private
  def set_cart
    @cart = current_user.current_cart
    redirect_to store_path if @cart.nil?
  end
end
