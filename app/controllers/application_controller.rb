class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar_url])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar_url])
  end

  def current_or_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        logging_in
        guest_user.destroy
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  def guest_user
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
  end

  def logging_in
    guest_user.cart.cart_items.each do |item|
      # Transfira os itens do carrinho do usuário convidado para o carrinho do usuário real
      current_user.cart.cart_items << item
    end
  end

  def create_guest_user
    user = User.create!(
      guest: true,
      name: "Visitante",
      email: "guest_#{Time.now.to_i}#{rand(100)}@example.com",
      password: "guest_password",
      password_confirmation: "guest_password"
    )
    session[:guest_user_id] = user.id
    user
  end

  def current_cart
    current_or_guest_user.cart || current_or_guest_user.create_cart!
  end

  helper_method :current_cart
end
