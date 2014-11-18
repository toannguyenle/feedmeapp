class Order < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :product
  belongs_to :user
  has_one :payment
  has_one :detail
  has_one :delivery
end
