class Api::V1::ProductsController < ApplicationController
  def index
    if params[:name]
      @products = Product.where("name ILIKE ?", "%#{params[:name]}%")
    else
      @products = Product.all
    end

    render json: @products.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: { error: @product.errors.messages }, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      render json: { product: @product, message: "Product updated successfully" }, status: :ok
    else
      render json: { error: product.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :categories, :condition, :description, :shipping_method, :region_of_origin, :sales_price, :delivery_time, :user_id)
  end
end
