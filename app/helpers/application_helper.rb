module ApplicationHelper

  def current_cart
    current_user.carts.first
  end
end
