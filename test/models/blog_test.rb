require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  test "valid blog" do
    blog = FactoryBot.build :blog
    assert blog.valid?
  end
  
  test 'invalid without title' do 
    blog = FactoryBot.build :blog
    blog.title = nil
    
    refute blog.valid?
  end

  test 'invalid without content' do
    blog = FactoryBot.build :blog
    blog.content = nil
    
    refute blog.valid?
  end
  
  test 'invalid without author' do
    blog = FactoryBot.build :blog
    blog.author = nil
    
    refute blog.valid?
    
  end
end
