require 'test_helper'

class SpotsControllerTest < ActionController::TestCase
  context "#index" do
    setup do 
      get :index
    end

    should_respond_with :success
    should_render_template :index
    should_assign_to :spots
  end

  context "html #create" do
    setup do
      sign_in_as Factory.create(:user)
      post :create, :spot => { :name => "Gigel", :latitude => 10, :longitude => 20 }
      @spot = Spot.last
    end

    should_redirect_to "created spot" do
      spot_path(@spot)
    end

    should "create a spot" do
      assert_equal("Gigel", @spot.name)
      assert_equal(10, @spot.latitude)
      assert_equal(20, @spot.longitude)
    end
  end

  context "xhr #create" do
    setup do
      sign_in_as Factory.create(:user)
      xhr :post, :create, :spot => { :name => "Gigel", :latitude => 10, :longitude => 20 }
      @spot = Spot.last
    end

    should "create a spot" do
      assert_equal("Gigel", @spot.name)
      assert_equal(10, @spot.latitude)
      assert_equal(20, @spot.longitude)
    end

    should_respond_with :created
  end
end
