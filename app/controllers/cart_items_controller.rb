class CartItemsController < ApplicationController
  def create
    cart = current_cart
    puts "------- Current Cart ID: #{cart.id}" # Imprimir o ID do carrinho para diagnóstico

    # Verifica se o produto já está no carrinho
    existing_item = cart.cart_items.find_by(product_id: cart_item_params[:product_id])

    if existing_item
      # Se o produto já estiver no carrinho, aumente a quantidade
      new_quantity = existing_item.quantity + cart_item_params[:quantity].to_i
      existing_item.update(quantity: new_quantity)
      redirect_to cart_path(cart), notice: "Quantidade atualizada no carrinho!"
    else
      # Se o produto não estiver no carrinho, adicione-o
      @cart_item = cart.cart_items.new(cart_item_params)
      if @cart_item.save
        redirect_to cart_path(cart), notice: "Item adicionado ao carrinho!"
      else
        redirect_to products_path, alert: "Erro ao adicionar ao carrinho."
      end
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

  def increment
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: @cart_item.quantity + 1)
    redirect_to cart_path(current_cart)
  end

  def decrement
    @cart_item = CartItem.find(params[:id])
    new_quantity = [@cart_item.quantity - 1, 1].max  # Garante que a quantidade não seja inferior a 1
    @cart_item.update(quantity: new_quantity)
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
