require 'test_helper'

class RatingsControllerTest < ActionController::TestCase
  context "html #create" do
    setup do
      sign_in_as @user = Factory.create(:user)
      @spot = Factory.create(:spot)
      post :create, :rating => { :spot_id => @spot.id, :rating => 3 }
    end

    should_redirect_to "created spot" do
      spot_path(@spot)
    end

    should "create a rating" do
      rating = Rating.last
      assert_equal(rating.spot_id, @spot.id)
      assert_equal(rating.rating, 3)
      assert_equal(rating.user_id, @user.id)
    end
  end
  
  context "xhr #create" do
  setup do
    sign_in_as @user = Factory.create(:user)
    @spot = Factory.create(:spot)
    xhr :post, :create, :rating => { :spot_id => @spot.id, :rating => 3 }
  end

  should "create a rating" do
    rating = Rating.last
    assert_equal(rating.spot_id, @spot.id)
    assert_equal(rating.rating, 3)
    assert_equal(rating.user_id, @user.id)
  end

  should_respond_with :created
 end
end
