class OrderDetailAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :address_id, :post_code, :delivery_area_id, :city, :address_one, :address_two, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :delivery_area_id,numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address_one
    validates :phone_number,format: {with: /\A\d{10,11}\z/}
    validates :token
  end

  def save
    order_detail = OrderDetail.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, delivery_area_id: delivery_area_id, city: city, phone_number: phone_number, address_one: address_one, address_two: address_two, order_detail_id: order_detail.id)
  end

end