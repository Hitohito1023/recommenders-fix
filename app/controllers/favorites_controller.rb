class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_item = PostItem.find(params[:post_item_id])
    favorite = @post_item.favorites.new(user_id: current_user.id)
    favorite.save
    render :create
  end

  def destroy
    @post_item = PostItem.find(params[:post_item_id])
    favorite = @post_item.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    render :destroy
  end

end
