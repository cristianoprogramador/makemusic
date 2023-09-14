class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_cart
    @cart_items = @cart.cart_items.includes(:product)
  end

  def create
    cart = current_cart
    @cart_item = cart.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_path(cart), notice: "Item adicionado ao carrinho!"
    else
      # handle the error case, redirecione para onde você achar mais adequado
      redirect_to root_path, alert: "Erro ao adicionar item ao carrinho."
    end
  end

  private

  def current_cart
    if current_user
      current_user.cart || current_user.create_cart
    else
      retrieve_cart_from_session
    end
  end

  def retrieve_cart_from_session
    cart = Cart.find_by(id: session[:cart_id])
    if cart.nil?
      cart = Cart.create
      session[:cart_id] = cart.id
    end
    cart
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end
end
