class Restaurant < ActiveRecord::Base
	has_many :orders
  has_many :products
end
