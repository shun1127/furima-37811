class OrderDetailController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]
  before_action :item_find, only: [:index, :create]

  def index
    @order_detail_address = OrderDetailAddress.new
  end

  def create
    @order_detail_address = OrderDetailAddress.new(order_detail_params)
    if @order_detail_address.valid?
      pay_item
      @order_detail_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_detail_params
    params.require(:order_detail_address).permit(:post_code,:delivery_area_id,:city,:address_one,:address_two,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_detail_params[:token],
      currency: 'jpy'
    )
  end

  def non_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order_detail.present?
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
