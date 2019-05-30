class ProductsController < ApplicationController
  before_action :set_product, only: [ :show, :edit,:update, :destroy]
  before_action :set_category, only: [ :index, :show, :new, :edit, :update, :destroy, :category]
  def index
   @product = Product.all.order("created_at DESC").page(params[:page]).per(8)
  end
  
  def new
    if user_signed_in?
      @product = Product.new
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
  
  def category
    @categories = Category.find_by(id: params[:id])
    @products = Product.where(category_id: @categories.id).page(params[:page]).per(8)
  end

  def edit
  end

  def update
    if @product.user_id == current_user.id
      @product.update(product_params)
      redirect_to product_path(@product.id)
    end
  end
  
  def destroy
    if @product.user_id == current_user.id
      @product.destroy
      redirect_to root_path
    else
      redirect_to action: 'show', controller: 'products'
    end
  end

  private

  def product_params
    params.require(:product).permit( :name, :description, :category_id, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
  def set_category
    @category = Category.all
  end
end
