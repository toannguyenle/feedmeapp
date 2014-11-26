FactoryGirl.define do

	factory :a_restaurant, class: Restaurant do

		name "McDonalds"
		phone_number "123-456-7890"
		street_address_1 "1520 2nd st"
		categories "Japanese, American"
		lat "90"
		lng "180"
		user_id "1"
		city "Santa Monica"
		state "CA"
		zipcode "90401"
		country "USA"

	end
	
end