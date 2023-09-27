class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def show
    @cart = current_cart
    @cart_items = @cart.cart_items.includes(:product).order("created_at ASC")
  end

  def create
    cart = current_cart
    @cart_item = cart.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_path(cart), notice: "Item adicionado ao carrinho!"
    else
      redirect_to root_path, alert: "Erro ao adicionar item ao carrinho."
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end
end
