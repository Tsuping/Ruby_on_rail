require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'invalid without email' do
    user = FactoryBot.build :user
    user.email = nil
    
    refute user.valid?
  end
  test 'invalid without name' do
    user = FactoryBot.build :user
    user.name = nil
    
    refute user.valid?
  end
  test 'invalid without password' do
    user = FactoryBot.build :user
    user.password  = nil
    
    refute user.valid?
  end
end
