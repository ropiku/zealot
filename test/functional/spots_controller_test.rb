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
  
  context "#get" do
    setup do
      @spot = Factory.create(:spot)
      get :show, :id => @spot.id
    end
    
    should_respond_with :success
    should_render_template :show
    should_assign_to :spot
  end
  
  context "#search" do
    setup do
      @spot = Factory.create(:spot)
      get :search, :q => @spot.name
    end
    
    should_respond_with :success
    should_render_template :search
    should_assign_to :spots
  end
end
