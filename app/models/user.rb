class User < ActiveRecord::Base
	has_many :orders
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_length_of :name, maximum: 50
  validates_length_of :email, maximum: 50
  validates_length_of :phone_number, maximum: 15
end
