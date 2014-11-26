require 'rails_helper'
require 'shoulda/matchers'

describe Restaurant do

	it "has a name" do
		restaurant = FactoryGirl.build_stubbed(:a_restaurant)
		expect(restaurant.name).to_not be_nil
	end

	it "has a phone_number" do
		restaurant = FactoryGirl.build_stubbed(:a_restaurant)
		expect(restaurant.phone_number).to_not be_nil
	end

	it "has a street_address_1" do
		restaurant = FactoryGirl.build_stubbed(:a_restaurant)
		expect(restaurant.street_address_1).to_not be_nil
	end

	it "has categories" do
		restaurant = FactoryGirl.build_stubbed(:a_restaurant)
		expect(restaurant.categories).to_not be_nil
	end

	it "has lat" do
		restaurant = FactoryGirl.build_stubbed(:a_restaurant)
		expect(restaurant.lat).to_not be_nil
	end

	it "has lng" do
		restaurant = FactoryGirl.build_stubbed(:a_restaurant)
		expect(restaurant.lng).to_not be_nil
	end

	it "has user_id" do
		restaurant = FactoryGirl.build_stubbed(:a_restaurant)
		expect(restaurant.user_id).to_not be_nil
	end

	it "has city" do
		restaurant = FactoryGirl.build_stubbed(:a_restaurant)
		expect(restaurant.city).to_not be_nil
	end

	it "has state" do
		restaurant = FactoryGirl.build_stubbed(:a_restaurant)
		expect(restaurant.state).to_not be_nil
	end

	it "has zipcode" do
		restaurant = FactoryGirl.build_stubbed(:a_restaurant)
		expect(restaurant.zipcode).to_not be_nil
	end

	it "has country" do
		restaurant = FactoryGirl.build_stubbed(:a_restaurant)
		expect(restaurant.country).to_not be_nil
	end
  
end