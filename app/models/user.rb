class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart, dependent: :destroy
  after_create :create_cart

  # Sobrescrevendo o método de validação de senha do Devise
  def password_required?
    super && !guest?
  end

  private

  def create_cart
    Cart.create(user: self)
  end
end
