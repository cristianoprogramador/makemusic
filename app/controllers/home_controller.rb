class HomeController < ApplicationController
  def index
    @products = if params[:category]
      Product.where(category: params[:category])
    else
      Product.all
    end
  end

  def search
    @products = Product.where("name ILIKE ?", "%#{params[:query]}%")
    render :index
  end
end
