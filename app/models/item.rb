class Item < ApplicationRecord
  has_one :order_detail
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day

  validates :name, presence: true
  validates :content, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank"} 
  validates :state_id, presence: true,numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, presence: true,numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_area_id, presence: true,numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, presence: true,numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true

end
