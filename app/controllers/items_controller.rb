class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :status_id, :shipping_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
