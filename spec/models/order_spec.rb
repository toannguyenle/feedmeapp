require 'rails_helper'
require 'shoulda/matchers'

describe Order do

	order = FactoryGirl.build_stubbed(:a_order)

	it "has a payment_type" do
		expect(order.payment_type).to_not be_nil
	end

	it "has processing_time" do
		expect(order.processing_time).to_not be_nil
	end

	it "has status" do
		expect(order.status).to_not be_nil
	end

	it "has delivery_option" do
		expect(order.delivery_option).to_not be_nil
	end

	it "delivered_by" do
		expect(order.delivered_by).to_not be_nil
	end

	it "has user_id" do
		expect(order.user_id).to_not be_nil
	end
  
end