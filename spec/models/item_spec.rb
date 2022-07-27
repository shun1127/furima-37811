require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context '商品出品ができる時' do
     it "image,name,content,category_id,state_id,delivery_charge_id,delivery_area_id,delivery_day_id,priceが存在すれば出品できる" do
      expect(@item).to be_valid
     end
    end

    context '商品出品ができない時' do
     it "imageが空では登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
     end
     it "nameが空では登録できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
     end
     it "contentが空では登録できない" do
      @item.content = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Content can't be blank")
     end
     it "category_idが空では登録できない" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
     end
     it "state_idが空では登録できない" do
      @item.state_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
     end
     it "delivaly_charge_idが空では登録できない" do
      @item.delivery_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
     end
     it "delivary_area_idが空では登録できない" do
      @item.delivery_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery area can't be blank")
     end
     it "delivary_dayが空では登録できない" do
      @item.delivery_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank")
     end
     it "priceが空では登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
     end
     it "価格が300円未満では出品できない" do
      @item.price = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
     end
     it "価格が9_999_999円を超えると出品できない" do
      @item.price = '99999999'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
     end
     it "priceは全角数字では登録できない" do
      @item.price = '１'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
     end
     it "userが紐付いていなければ出品できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
     end
    end 
  end
end
