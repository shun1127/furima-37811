require 'rails_helper'

RSpec.describe OrderDetailAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_detail_address = FactoryBot.build(:order_detail_address, user_id: user.id,item_id: item.id)
    sleep 0.1
  end

  describe "配送先情報の登録" do
    context '配送先情報の登録ができる時' do
     it "全ての値が正しく存在すれば出品できる" do
      expect(@order_detail_address).to be_valid
     end
    end

    context '商品購入ができない時' do
      it "user_idが空では購入できない" do
        @order_detail_address.user_id = ''
        @order_detail_address.valid?
        expect(@order_detail_address.errors.full_messages).to include("User can't be blank")
       end
       it "item_idが空では購入できない" do
        @order_detail_address.item_id = ''
        @order_detail_address.valid?
        expect(@order_detail_address.errors.full_messages).to include("Item can't be blank")
       end
     it "post_codeが空では登録できない" do
      @order_detail_address.post_code = ''
      @order_detail_address.valid?
      expect(@order_detail_address.errors.full_messages).to include("Post code can't be blank")
     end
     it "delivery_area_idが「---」では登録できない" do
      @order_detail_address.delivery_area_id = '1'
      @order_detail_address.valid?
      expect(@order_detail_address.errors.full_messages).to include("Delivery area can't be blank")
     end
     it "cityが空では登録できない" do
      @order_detail_address.city = ''
      @order_detail_address.valid?
      expect(@order_detail_address.errors.full_messages).to include("City can't be blank")
     end
     it "address_oneが空では登録できない" do
      @order_detail_address.address_one = ''
      @order_detail_address.valid?
      expect(@order_detail_address.errors.full_messages).to include("Address one can't be blank")
     end
     it "phone_numberが9桁以下では購入できない" do
      @order_detail_address.phone_number = '123'
      @order_detail_address.valid?
      expect(@order_detail_address.errors.full_messages).to include("Phone number is invalid")
     end
     it "phone_numberは12桁以上では登録できない" do
      @order_detail_address.phone_number = '1234567890123'
      @order_detail_address.valid?
      expect(@order_detail_address.errors.full_messages).to include("Phone number is invalid")
     end
     it "phone_numberが英数字以外が含まれている場合は購入できない" do
      @order_detail_address.phone_number = 'a012'
      @order_detail_address.valid?
      expect(@order_detail_address.errors.full_messages).to include("Phone number is invalid")
     end
     it "phone_numberが空では登録できない" do
      @order_detail_address.phone_number = ''
      @order_detail_address.valid?
      expect(@order_detail_address.errors.full_messages).to include("Phone number can't be blank")
     end
     it "post_codeは「3桁ハイフン4桁」の半角文字列以外では登録できない" do
      @order_detail_address.post_code = '0000000'
      @order_detail_address.valid?
      expect(@order_detail_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
     end
     it 'トークンが空だと保存できないこと' do
      @order_detail_address.token = nil
      @order_detail_address.valid?
      expect(@order_detail_address.errors.full_messages).to include("Token can't be blank")
    end
    end 
  end
end
