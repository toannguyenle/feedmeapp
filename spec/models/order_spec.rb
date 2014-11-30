require 'rails_helper'
require 'shoulda/matchers'

describe Order do

	it { should have_many(:order_products) }
	it { should belong_to(:user) }
	it { should validate_uniqueness_of(:user_id) }

end

describe OrdersController do 

end

	