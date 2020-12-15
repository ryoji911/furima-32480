class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
  
  def order_params
      params.require(:order).permit(:postal_code, :area_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    if Item.find(params[:item_id]).purchase.present?
      redirect_to root_path
    elsif Item.find(params[:item_id]).user_id == current_user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
