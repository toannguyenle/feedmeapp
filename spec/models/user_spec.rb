require 'rails_helper'
require 'shoulda/matchers'

describe User do
  it 'has a name' do
    user = FactoryGirl.build_stubbed(:a_user)
    expect(user.name).to_not be_nil
  end

  it 'has an email' do
    user = FactoryGirl.build_stubbed(:a_user)
    expect(user.email).to_not be_nil
  end

  # Data Validation
  # Make sure email is unique
  it {should validate_uniqueness_of(:email)}
  # Make sure email has the right format
  it do
    should allow_value('jim@j.com').
    for(:email)
  end
  it do
    should !allow_value('carey').
    for(:email)
  end

  # Make sure email does not reach maximum length and name and phone number
  it {should ensure_length_of(:name).is_at_most(50)}
  it {should ensure_length_of(:email).is_at_most(50)}
  it {should ensure_length_of(:phone_number).is_at_most(15)}
end