require 'rails_helper'
require 'shoulda/matchers'

describe Product do

	it "has a name" do
		product = FactoryGirl.build_stubbed(:a_product)
		expect(product.name).to_not be_nil
	end

	it "has a category" do
		product = FactoryGirl.build_stubbed(:a_product)
		expect(product.categories).to_not be_nil
	end

	it "has a description" do
		product = FactoryGirl.build_stubbed(:a_product)
		expect(product.description).to_not be_nil
	end

	it "has image_urls" do
		product = FactoryGirl.build_stubbed(:a_product)
		expect(product.image_urls).to_not be_nil
	end

	it "has regular_price" do
		product = FactoryGirl.build_stubbed(:a_product)
		expect(product.regular_price).to_not be_nil
	end

	it "has discount_price" do
		product = FactoryGirl.build_stubbed(:a_product)
		expect(product.discount_price).to_not be_nil
	end

	it "has discount_start_time" do
		product = FactoryGirl.build_stubbed(:a_product)
		expect(product.discount_start_time).to_not be_nil
	end

	it "has discount_end_time" do
		product = FactoryGirl.build_stubbed(:a_product)
		expect(product.discount_end_time).to_not be_nil
	end

	it "has discount_inventory" do
		product = FactoryGirl.build_stubbed(:a_product)
		expect(product.discount_inventory).to_not be_nil
	end

	it "has ordr" do
		product = FactoryGirl.build_stubbed(:a_product)
		expect(product.ordr).to_not be_nil
	end

	it "has delivery_method" do
		product = FactoryGirl.build_stubbed(:a_product)
		expect(product.delivery_method).to_not be_nil
	end

	it "has restaurant_id" do
		product = FactoryGirl.build_stubbed(:a_product)
		expect(product.restaurant_id).to_not be_nil
	end
    
end