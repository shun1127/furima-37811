class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :ensure_user, only: [:edit, :update]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
   if @item.update(item_params)
    redirect_to root_path
   else
    render :edit
   end
  end


  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:content,:category_id,:state_id,:delivery_charge_id,:delivery_area_id,:delivery_day_id,:price).merge(user_id: current_user.id)
  end

  def ensure_user
    @items = current_user.items
    @item = @items.find_by(id: params[:id])
    redirect_to root_path unless @item
  end
