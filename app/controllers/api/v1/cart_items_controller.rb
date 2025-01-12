class Api::V1::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end
end
