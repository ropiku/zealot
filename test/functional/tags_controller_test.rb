require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  context "get tag" do
    setup do
      @tag = Factory.create(:tag)
      @spot = Factory.create(:spot)
      @tag.spots << @spot
      
      get :show, :id => @tag.name
    end
    
    should_assign_to :tag
    should_respond_with :success
  end
  
  context "get index" do
    setup do
      get :index
    end
    
    should_respond_with :success
    should_assign_to :tags
  end
end
