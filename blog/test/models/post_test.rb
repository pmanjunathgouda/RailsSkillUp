require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
	test "should not save post without title" do
	  posts = Post.new
	  assert_not posts.save
	end
end
