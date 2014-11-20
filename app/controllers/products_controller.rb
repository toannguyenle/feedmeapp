class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products, status: 200
  end

  def new
    product = Product.new
    # render json: product, status: 201
  end
  
  def create
    product = Product.create(product_params)
    render json: product, status: 201
  end

  def update
    product = Product.find(params[:id])
    product.update_attributes(product_params)
    render nothing: true, status: 204
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render nothing: true, status: 204
  end

  private

  def product_params
    params.require(:product).permit(:name, :categories, :description, :image_urls, :regular_price, :discount_price, :discount_start_time, :discount_end_time, :discount_inventory, :order_id)
  end
end