require 'rails_helper'
require 'shoulda/matchers'

describe OrderProduct do

	it 'has order_id' do
    orderProduct = FactoryGirl.build_stubbed(:order_product)
    expect(orderProduct.order_id).to_not be_nil
    end

    it 'has product_id' do
    orderProduct = FactoryGirl.build_stubbed(:order_product)
    expect(orderProduct.product_id).to_not be_nil
    end
  
it {should belong_to(:order)}
it {should belong_to(:product)}

end
