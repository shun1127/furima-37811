class Item < ApplicationRecord
  #has_one :order_detail
  belongs_to :user
end
