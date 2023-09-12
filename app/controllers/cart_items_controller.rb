class CartItemsController < ApplicationController
  def create
    @cart_item = current_user.cart.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_path(current_user.cart), notice: "Item adicionado ao carrinho!"
    else
      redirect_to products_path, alert: "Erro ao adicionar ao carrinho."
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_path(current_user.cart)
    else
      render :edit
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(current_user.cart)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

end
