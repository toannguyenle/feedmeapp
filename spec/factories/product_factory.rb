FactoryGirl.define do

	factory :a_product, class: Product do

		name "pepperoni pizza"
		categories "pizza"
		description "delicious"
		image_urls "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQahg4PepBSDY4vJXOdGtS2Mfb5N-TnV83-Wy23kIoasjj5iywYww"
		regular_price "15"
		discount_price "10"
		discount_start_time 12/01/14
		discount_end_time 12/02/14
		discount_inventory "25"
		ordr "1"
		delivery_method "pick-up"
		restaurant_id "123"

	end
	
end