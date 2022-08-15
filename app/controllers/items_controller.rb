class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
     render :new
    end
  end

  def show
  end

  def edit
    if @item.user_id == current_user.id && @item.order_detail.nil?
    else
      redirect_to root_path
    end
  end

  def update
   if @item.update(item_params)
    redirect_to item_path
   else
    render :edit
   end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:content,:category_id,:state_id,:delivery_charge_id,:delivery_area_id,:delivery_day_id,:price).merge(user_id: current_user.id)
  end

  def ensure_user
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end