class Order < ActiveRecord::Base
  has_many :order_products
  has_many :products, through: :order_products
  belongs_to :user
  validates_uniqueness_of :user_id
end
