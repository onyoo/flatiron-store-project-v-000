class CartsController < ApplicationController
  before_action :set_cart, only: [:checkout]

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart.checkout
    current_user.current_cart = nil
    redirect_to store_path
  end

  private

  def set_cart
    @cart = current_user.current_cart
    redirect_to store_path if @cart.nil?
  end
end
