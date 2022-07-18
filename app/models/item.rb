class Item < ApplicationRecord
  #has_one :order_detail
  belongs_to :user
  has_one_attached :image
end
