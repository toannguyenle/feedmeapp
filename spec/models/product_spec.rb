require 'rails_helper'
require 'shoulda/matchers'

describe Product do

	product = FactoryGirl.build_stubbed(:a_product)

	it "has a name" do
		expect(product.name).to_not be_nil
	end

	it "has a category" do
		expect(product.categories).to_not be_nil
	end

	it "has a description" do
		expect(product.description).to_not be_nil
	end

	it "has image_urls" do
		expect(product.image_urls).to_not be_nil
	end

	it "has regular_price" do
		expect(product.regular_price).to_not be_nil
	end

	it "has discount_price" do
		expect(product.discount_price).to_not be_nil
	end

	it "has discount_start_time" do
		expect(product.discount_start_time).to_not be_nil
	end

	it "has discount_end_time" do
		expect(product.discount_end_time).to_not be_nil
	end

	it "has discount_inventory" do
		expect(product.discount_inventory).to_not be_nil
	end

	it "has ordr" do
		expect(product.ordr).to_not be_nil
	end

	it "has delivery_method" do
		expect(product.delivery_method).to_not be_nil
	end

	it "has restaurant_id" do
		expect(product.restaurant_id).to_not be_nil
	end
    
end