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
end
