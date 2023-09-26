class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart, dependent: :destroy
  after_create :create_cart
  has_many :orders

  validates :name, presence: true
  validates_format_of :avatar_url, :with => /\A(|(http|https):\/\/\S+)\z/, :message => "must be blank or begin with http:// or https://", allow_blank: true


  # Sobrescrevendo o método de validação de senha do Devise
  def password_required?
    super && !guest?
  end

  private

  def create_cart
    Cart.create(user: self)
  end
end
