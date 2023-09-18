class CartItemsController < ApplicationController
  def create
    cart = current_cart
    puts "------- Current Cart ID: #{cart.id}" # Imprimir o ID do carrinho para diagnóstico
    @cart_item = cart.cart_items.new(cart_item_params)

    if @cart_item.save
      redirect_to cart_path(cart), notice: "Item adicionado ao carrinho!"
    else
      redirect_to products_path, alert: "Erro ao adicionar ao carrinho."
    end
  end


  def update
    @cart_item = CartItem.find(params[:id])

    if @cart_item.update(cart_item_params)
      redirect_to cart_path(current_cart)
    else
      render :edit
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(current_cart)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

  def current_cart
    cart = current_or_guest_user.cart
    if cart.nil?
      cart = current_or_guest_user.create_cart
    end
    cart
  end


  def retrieve_cart_from_session
    cart = Cart.find_by(id: session[:cart_id])

    if cart.nil?
      cart = Cart.create
      session[:cart_id] = cart.id
    end

    cart
  end
end
