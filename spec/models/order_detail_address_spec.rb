require 'rails_helper'

RSpec.describe OrderDetailAddress, type: :model do
  before do
    @order_detail_address = FactoryBot.build(:order_detail_address)
  end

  describe "配送先情報の登録" do
    context '配送先情報の登録ができる時' do
     it "全ての値が正しく存在すれば出品できる" do
      expect(@order_detail_address).to be_valid
     end
    end

    context '商品購入ができない時' do
     it "post_codeが空では登録できない" do
      @order_detail_address.post_code = nil
      @order_detail_address.valid?
      expect(@order_detail_address.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
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
     it "phone_numberは10桁以上11桁以内の半角数値以外では登録できない" do
      @order_detail_address.phone_number = '000000000000'
      @order_detail_address.valid?
      expect(@order_detail_address.errors.full_messages).to include("Phone number is invalid")
     end
     it 'トークンが空だと保存できないこと' do
      @order_detail_address.token = nil
      @order_detail_address.valid?
      expect(@order_detail_address.errors.full_messages).to include("Token can't be blank")
    end
    end 
  end
end
