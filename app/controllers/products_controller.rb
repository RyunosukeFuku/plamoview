class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  
  def index
  end
  
  def new
    if user_signed_in?
      @product = Product.new
      #@categories = Category.ransack(parent_id_null: true).result
    else
      redirect_to new_user_registration_path
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
       redirect_to root_path ,notice: '記事が投稿されました'
     else
       render :new
     end
     
  end
  
  def show
  
  end
  
  private

  def product_params
    params.require(:product).permit( :name, :description, :category_id, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
