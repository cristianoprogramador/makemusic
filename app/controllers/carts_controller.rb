class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
    @cart_items = @cart.cart_items.includes(:product)
  end

  def create
    @cart = current_user.cart || current_user.create_cart
    @cart_item = @cart.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_path(@cart), notice: "Item adicionado ao carrinho!"
    else
      # handle the error case
    end
  end

end
