FactoryGirl.define do

	factory :a_order, class: Order do 
		payment_type "payment_type" 
		status "status"
	end
	
end