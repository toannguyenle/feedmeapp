require 'rails_helper'
require 'shoulda/matchers'

describe Order do

	it 'has payment_type' do
    order = FactoryGirl.build_stubbed(:a_order)
    expect(order.payment_type).to_not be_nil
    end

    it 'has status' do
    order = FactoryGirl.build_stubbed(:a_order)	
    expect(order.status).to_not be_nil
	end

	it { should have_many(:order_products) }
	it { should belong_to(:user) }
	it { should validate_uniqueness_of(:user_id) }

end



	