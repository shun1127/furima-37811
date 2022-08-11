class OrderDetailController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order_detail_address = OrderDetailAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_detail_address = OrderDetailAddress.new(order_detail_params)
    @item = Item.find(params[:item_id])
    if @order_detail_address.valid?
      @order_detail_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_detail_params
    params.require(:order_detail_address).permit(:post_code,:delivery_area_id,:city,:address_one,:address_two,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
