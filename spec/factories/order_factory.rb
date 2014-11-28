FactoryGirl.define do

	factory :a_order, class: Order do

		payment_type
		processing_time
		status
		delivery_option
		delivered_by
		additional_info
		user_id

	end
	
end