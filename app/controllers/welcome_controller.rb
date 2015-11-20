class WelcomeController < ApplicationController
  def index
    #@cart = Cart.find_by status: 'open'
    @cart = Cart.where(status: 'open')
    @cart_products = CartProduct.where(cart_id: @cart)
  end
end
