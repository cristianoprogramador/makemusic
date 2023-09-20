class HomeController < ApplicationController

  def index
    if params[:category]
      @products = Product.where(category: params[:category])
    else
      @products = Product.all
    end
  end

  def search
    @products = Product.where("name ILIKE ?", "%#{params[:query]}%")
    render :index
  end

end
