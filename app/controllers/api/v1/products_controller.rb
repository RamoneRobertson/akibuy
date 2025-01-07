class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all

    render json: @products.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])

    render json: @product
  end

  def new
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :categories, :condition, :description, :shipping_method, :region_of_origin, :sales_price, :delivery_time)
  end
end
