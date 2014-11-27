require 'rails_helper'
require 'shoulda/matchers'

describe Restaurant do

	restaurant = FactoryGirl.build_stubbed(:a_restaurant)

	it "has a name" do	
		expect(restaurant.name).to_not be_nil
	end

	it "has a phone_number" do
		expect(restaurant.phone_number).to_not be_nil
	end

	it "has a street_address_1" do
		expect(restaurant.street_address_1).to_not be_nil
	end

	it "has categories" do
		expect(restaurant.categories).to_not be_nil
	end

	it "has lat" do
		expect(restaurant.lat).to_not be_nil
	end

	it "has lng" do
		expect(restaurant.lng).to_not be_nil
	end

	it "has user_id" do
		expect(restaurant.user_id).to_not be_nil
	end

	it "has city" do
		expect(restaurant.city).to_not be_nil
	end

	it "has state" do
		expect(restaurant.state).to_not be_nil
	end

	it "has zipcode" do
		expect(restaurant.zipcode).to_not be_nil
	end

	it "has country" do
		expect(restaurant.country).to_not be_nil
	end
  
end