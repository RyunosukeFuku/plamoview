class LikesController < ApplicationController
  before_action :set_variables
  def create
    @like = Like.create(user_id: current_user.id, product_id: params[:product_id])
    @likes_btn = Like.find_by(user_id: current_user.id, product_id: @product_like.id)
    @product_like.reload
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, product_id: params[:product_id])
    @like.destroy
    @likes_btn = Like.find_by(user_id: current_user.id, product_id: @product_like.id)
    @product_like.reload
  end

  def set_variables
    @product_like = Product.find(params[:product_id])
  end
end
