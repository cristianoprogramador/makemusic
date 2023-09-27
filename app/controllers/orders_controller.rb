class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    if current_user.nil?
      redirect_to new_user_session_path, alert: "Por favor, faça login para continuar."
      return
    end

    # Inicializando @cart_items
    @cart_items = current_cart.cart_items

    # Criar um novo pedido associado ao usuário atual
    order = current_user.orders.new(status: "Preparando Envio", total: calculate_total)

    # Mover os itens do carrinho para o pedido
    @cart_items.each do |cart_item|
      order.order_items.new(product: cart_item.product, quantity: cart_item.quantity, price: cart_item.product.price)
    end

    # Se o pedido for salvo corretamente, limpar o carrinho
    if order.save
      current_cart.destroy
      redirect_to orders_path, notice: "Compra finalizada com sucesso!"
    else
      redirect_to cart_path(current_cart), alert: "Houve um erro ao finalizar sua compra."
    end
  end

  def index
    @orders = current_user.orders
  end

  private

  def calculate_total
    # Soma o total dos itens mais o frete
    @cart_items.sum { |item| item.product.price * item.quantity } + 40
  end
end
